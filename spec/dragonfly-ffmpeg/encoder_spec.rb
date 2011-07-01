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
