require 'spec_helper'

describe StylishRte do
  it "is a module" do
    StylishRte.should be_a_kind_of Module
  end

  it "setup block yields self" do
    StylishRte.setup do |config|
      StylishRte.should be config
    end
  end
end
