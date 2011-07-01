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

module EnMasse
  module Dragonfly
    module FFMPEG
      class Encoder
        class Profile
          
          attr_reader :name
          attr_accessor :encoding_options
          attr_accessor :output_extension
          
          def initialize(name, encoding_options)
            @name = name
            @encoding_options = encoding_options
          end
          
        end
      end
    end
  end
end
