require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Flvorflv do

  describe "binary version for 1.8f" do
    before do
      stub(Flvorflv).execute_binary { "FLVStreamer v1.8f\n(c) 2009 Andrej Stepanchuk, The Flvstreamer Team, license: GPL" }
      @version = Flvorflv.version
    end

    it "should call flvstreamer --help" do
      Flvorflv.should have_received.execute_binary("--help")
    end

    it "should return 1.8f" do
      @version.should == "1.8f"
    end
  end

  describe "basic use case do" do
    before do
      stub(Flvorflv).execute_binary

      Flvorflv.run(:rtmp => 'rtmp://hostname/something.flv',
               :start => 1,
               :stop => 2,
               :output => 'something.flv')
    end

    it "should call flvstream --output something.flv --rtmp rtmp://hostname/something.flv --start 1 --stop 2" do
      Flvorflv.should have_received.execute_binary("--output something.flv --rtmp rtmp://hostname/something.flv --start 1 --stop 2")
    end

  end

end
