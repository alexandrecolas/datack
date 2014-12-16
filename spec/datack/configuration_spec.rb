require 'spec_helper.rb'

describe "Configuration" do
  before do
    Datack.configure do |config|
      config.debug = true
    end
  end

  it "should be possible to change base configuration" do
    Datack.configuration.debug.should eq true
  end

end
