module EnMasse
  module Dragonfly
    module FFMPEG
    end
  end
end

require 'dragonfly-ffmpeg/analyser'
require 'dragonfly-ffmpeg/config'

Dragonfly::App.register_configuration(:ffmpeg) { EnMasse::Dragonfly::FFMPEG::Config }
