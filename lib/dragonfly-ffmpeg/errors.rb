module EnMasse
  module Dragonfly
    module FFMPEG
      class DragonflyFFMPEGError < StandardError 
      end
      
      class EncoderError < DragonflyFFMPEGError
      end
      
      class UnknownEncoderProfile < EncoderError
      end
    end
  end
end
