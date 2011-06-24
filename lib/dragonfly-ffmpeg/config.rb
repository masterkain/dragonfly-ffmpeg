module EnMasse
  module Dragonfly
    module FFMPEG
      module Config
        
        def self.apply_configuration(app, opts = {})
          app.configure do |c|
            c.analyser.register(Analyser)
            c.encoder.register(Encoder) do |e|
              e.output_directory = opts[:output_directory] if opts.has_key?(:output_directory)
              e.encoder_profiles = opts[:encoder_profiles] if opts.has_key?(:encoder_profiles)
            end
          end
        end
        
      end
    end
  end
end
