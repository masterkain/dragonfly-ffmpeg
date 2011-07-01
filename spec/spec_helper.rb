#
# Author:: Jamie Winsor (<jamie@enmasse.com>)
# Copyright:: 2011, En Masse Entertainment, Inc
# License:: Apache License, Version 2.0
# 
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
#     http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

require 'rubygems'
require 'bundler'
Bundler.setup(:default, :test)

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'rspec'
require 'dragonfly-ffmpeg'
require 'support/video_matchers'

SAMPLES_DIR = File.expand_path(File.dirname(__FILE__) + '/../samples') unless defined?(SAMPLES_DIR)

require 'logger'
LOG_FILE = File.dirname(__FILE__) + '/spec.log' unless defined?(LOG_FILE)
TMP_DIR = File.dirname(__FILE__) + '/tmp' unless defined?(TMP_DIR)
FileUtils.mkdir_p(TMP_DIR)
FileUtils.rm_rf Dir.glob(TMP_DIR + '/*')
FileUtils.rm_rf(LOG_FILE)

logger = Logger.new(LOG_FILE)
logger.level = Logger::INFO
FFMPEG.logger = logger

def test_app
  Dragonfly::App.send(:new)
end
