require 'spec_helper'

describe StylishRte::Asset do
  before(:each) do
    @asset = StylishRte::Asset.new
  end

  it "can be instantiated" do
    @asset.should be_an_instance_of(StylishRte::Asset)
  end

  it "can have a stored asset" do
#    @asset.data = @params[:file]
#    @asset.data = File.open(@params[:file])
#    @asset.save!

#    @asset.data.url.should equal "data url"
  end

#  it "can be saved successfully" do
#    StylishRte::Asset.create.should be_persisted
#  end
end
