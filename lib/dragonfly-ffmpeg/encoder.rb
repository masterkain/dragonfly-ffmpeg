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
require 'pathname'
require 'dragonfly-ffmpeg/encoder/profile'

module EnMasse
  module Dragonfly
    module FFMPEG
      class Encoder
        
        include ::Dragonfly::Configurable
        
        configurable_attr :encoder_profiles, {
          :mp4 => [
            Profile.new(:default,
              :video_codec => "libx264",
              :resolution => "1280x720",
              :frame_rate => 29.97,
              :video_bitrate => 3072,
              :audio_codec => "libfaac",
              :audio_channels => 2,
              :audio_sample_rate => 48000,
              :video_preset => "hq"
            )
          ],
          :ogv => [
            Profile.new(:default,
              :video_codec => "libtheora",
              :resolution => "1280x720",
              :frame_rate => 29.97,
              :video_bitrate => 3072,
              :audio_codec => "libvorbis",
              :audio_channels => 2,
              :audio_sample_rate => 48000
            )
          ],
          :webm => [
            Profile.new(:default,
              :video_codec => "libvpx",
              :resolution => "1280x720",
              :frame_rate => 29.97,
              :video_bitrate => 3072,
              :audio_codec => "libvorbis",
              :audio_channels => 2,
              :audio_sample_rate => 48000,
              :custom => "-f webm"
            )
          ]
        }
        
        configurable_attr :output_directory, '/tmp'
        
        def encode(temp_object, format, profile_id = :default, options = {})
          if profile_id.is_a?(Profile)
            profile = profile_id
          else
            raise UnknownEncoderProfile unless profile_defined?(format, profile_id.to_sym)
            profile = get_profile(format, profile_id.to_sym)
          end
          
          options.merge!(profile.encoding_options)
          
          origin = ::FFMPEG::Movie.new(temp_object.path)
          new_filename = ::Pathname.new(temp_object.path).sub_ext(".#{format}").basename
          new_filepath = File.join(output_directory, new_filename)
          transcoded = origin.transcode(new_filepath, options)
          ::Dragonfly::TempObject.new(File.read(transcoded.path))
        end
        
        private
        
        def profiles(format)
          encoder_profiles[format]
        end
        
        def get_profile(format, profile_name)
          result = profiles(format).select { |profile| profile.name == profile_name }
          result.first
        end
        
        def profile_defined?(format, profile_name)
          return false if profiles(format).nil?
          
          encoder_profiles[format].any? { |profile| profile.name == profile_name }
        end
        
      end
    end
  end
end
