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
        
        private
        
        def inspect(method, temp_object)
          ::FFMPEG::Movie.new(temp_object.path).send(method)
        end
        
      end
    end
  end
end
