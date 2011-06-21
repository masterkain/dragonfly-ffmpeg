module EnMasse
  module Dragonfly
    module FFMPEG
      module Config
        def self.apply_configuration(app, opts = {})
          app.configure do |c|
            c.analyser.register(Analyser)
          end
        end
      end
    end
  end
end
