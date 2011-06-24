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
