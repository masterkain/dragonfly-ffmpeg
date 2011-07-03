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

require 'streamio-ffmpeg'

module EnMasse
  module Dragonfly
    module FFMPEG
      class Analyser

        include ::Dragonfly::Loggable

        def frame_rate(temp_object)
          inspect(:frame_rate, temp_object)
        end
        alias_method :fps, :frame_rate

        def duration(temp_object)
          inspect(:duration, temp_object)
        end

        def bitrate(temp_object)
          inspect(:bitrate, temp_object)
        end

        def size(temp_object)
          inspect(:size, temp_object)
        end

        def video_stream(temp_object)
          inspect(:video_stream, temp_object)
        end

        def video_codec(temp_object)
          inspect(:video_codec, temp_object)
        end

        def colorspace(temp_object)
          inspect(:colorspace, temp_object)
        end

        def resolution(temp_object)
          inspect(:resolution, temp_object)
        end

        def v_width(temp_object)
          inspect(:width, temp_object)
        end

        def v_height(temp_object)
          inspect(:height, temp_object)
        end

        def audio_stream(temp_object)
          inspect(:audio_stream, temp_object)
        end

        def audio_codec(temp_object)
          inspect(:audio_codec, temp_object)
        end

        def audio_sample_rate(temp_object)
          inspect(:audio_sample_rate, temp_object)
        end

        def audio_channels(temp_object)
          inspect(:audio_channels, temp_object)
        end

        def valid?(temp_object)
          inspect(:valid?, temp_object)
        end

        def artist(temp_object)
          inspect(:artist, temp_object)
        end

        def album(temp_object)
          inspect(:album, temp_object)
        end

        def title(temp_object)
          inspect(:title, temp_object)
        end

        def genre(temp_object)
          inspect(:genre, temp_object)
        end

        def date(temp_object)
          inspect(:date, temp_object)
        end

        def number(temp_object)
          inspect(:number, temp_object)
        end


        private

          def inspect(method, temp_object)
            ::FFMPEG::Movie.new(temp_object.path).send(method)
          end

      end
    end
  end
end
