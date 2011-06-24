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
