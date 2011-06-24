RSpec::Matchers.define :have_video_codec do |v_codec|
  match do |given|
    analyser = EnMasse::Dragonfly::FFMPEG::Analyser.new
    analyser.video_codec(given) == v_codec.to_s
  end
end
