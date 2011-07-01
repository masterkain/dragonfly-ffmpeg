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

describe EnMasse::Dragonfly::FFMPEG::Analyser do
  
  before(:each) do
    video_path = SAMPLES_DIR + '/test-movie.mov'
    @video = Dragonfly::TempObject.new(File.new(video_path))
    @analyser = EnMasse::Dragonfly::FFMPEG::Analyser.new
    @analyser.log = Logger.new(LOG_FILE)
  end
  
  it "should return the width" do 
    @analyser.v_width(@video).should == 1280
  end
  
  it "should return the height" do
    @analyser.v_height(@video).should == 720
  end
  
  it "should return the frame rate" do
    @analyser.frame_rate(@video).should == 29.97
  end
  
  it "should return the duration" do
    @analyser.duration(@video).should == 0.6
  end
  
  it "should return the bit rate" do
    @analyser.bitrate(@video).should == 24328
  end
  
  it "should return the size" do
    @analyser.size(@video).should == 1881419
  end
  
  it "should return the video stream" do
    @analyser.video_stream(@video).should == "h264, yuv420p, 1280x720, 34415 kb/s, PAR 1280:1280 DAR 16:9, 29.97 fps, 29.97 tbr, 30k tbn, 60k tbc"
  end
  
  it "should return the video codec" do
    @analyser.video_codec(@video).should == "h264"
  end
  
  it "should return the colorspace" do
    @analyser.colorspace(@video).should == "yuv420p"
  end
  
  it "should return the resolution" do
    @analyser.resolution(@video).should == "1280x720"
  end
  
  it "should return the audio stream" do
    @analyser.audio_stream(@video).should == "aac, 48000 Hz, stereo, s16, 89 kb/s"
  end
  
  it "should return the audio codec" do
    @analyser.audio_codec(@video).should == "aac"
  end
  
  it "should return the audio sample rate" do
    @analyser.audio_sample_rate(@video).should == 48000
  end
  
  it "should return the audio channels" do
    @analyser.audio_channels(@video).should == 2
  end
  
  it "should return that the video is valid" do
    @analyser.valid?(@video).should be_true
  end
    
end
