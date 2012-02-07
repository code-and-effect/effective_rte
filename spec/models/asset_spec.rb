require 'spec_helper'

describe StylishRte::Asset do
  before(:each) do
    @asset = StylishRte::Asset.new

    @asset.data_file_name = "Filename"
  end

  it "can be instantiated" do
    @asset.should be_an_instance_of(StylishRte::Asset)
  end

  it "can be saved successfully" do
    StylishRte::Asset.create.should be_persisted
  end

  it "should have a data file name" do
    @asset.data_file_name.should_be "Filename"
  end

end
