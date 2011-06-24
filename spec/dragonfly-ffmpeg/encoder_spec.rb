require 'spec_helper'

describe EnMasse::Dragonfly::FFMPEG::Encoder do
  
  before(:all) do
    video_path = SAMPLES_DIR + '/test-movie.mov'
    @video = Dragonfly::TempObject.new(File.new(video_path))
    @encoder = EnMasse::Dragonfly::FFMPEG::Encoder.new
    @encoder.output_directory = TMP_DIR
  end
  
  it "should encode the video using the default mp4 encoding profile" do
    video = @encoder.encode(@video, :mp4)
    video.should have_video_codec(:h264)
  end
  
  it "should encode the video using the default ogv encoding profile" do
    video = @encoder.encode(@video, :ogv)
    video.should have_video_codec(:theora)
  end
  
  it "should encode the video using the default webm encoding profile" do
    video = @encoder.encode(@video, :webm)
    video.should have_video_codec(:libvpx)
  end
  
  it "should encode the video using an encoding profile that is defined inline" do
    profile = EnMasse::Dragonfly::FFMPEG::Encoder::Profile.new(:webm_720p,
      :video_codec => "libvpx",
      :resolution => "1280x720",
      :frame_rate => 29.97,
      :video_bitrate => 3072,
      :audio_codec => "libvorbis",
      :audio_channels => 2,
      :audio_sample_rate => 48000,
      :custom => "-f webm"
    )
    video = @encoder.encode(@video, :webm, profile)
    video.should have_video_codec(:libvpx)
  end
  
  it "should throw UnknownEncoderProfile if the encoding profile is not defined" do
    lambda {
      @encoder.encode(@video, :lol264, :h264_720p)
    }.should raise_error(EnMasse::Dragonfly::FFMPEG::UnknownEncoderProfile)
  end

end
