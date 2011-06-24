module EnMasse
  module Dragonfly
    module FFMPEG
    end
  end
end

require 'dragonfly'
require 'dragonfly-ffmpeg/errors'
require 'dragonfly-ffmpeg/config'
require 'dragonfly-ffmpeg/analyser'
require 'dragonfly-ffmpeg/encoder'

Dragonfly::App.register_configuration(:ffmpeg) { EnMasse::Dragonfly::FFMPEG::Config }
