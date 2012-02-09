require 'carrierwave/test/matchers'

describe StylishRte::AssetUploader do
  include CarrierWave::Test::Matchers

  before do
    StylishRte::AssetUploader.enable_processing = true
    @asset = StylishRte::Asset.new
    @uploader = StylishRte::AssetUploader.new(@asset, :data)
    @uploader.store!(File.open(RSpec.configuration.fixture_path + "/image-175x55.png"))
  end

  after do
    StylishRte::AssetUploader.enable_processing = false
    @uploader.remove!
  end

  it "should have uploaded the file to the store" do
    @original = File.open(RSpec.configuration.fixture_path + "/image-175x55.png").read
    @saved = File.open(@uploader.file.path).read

    @original.should eq @saved
  end

  it "should make the image readable only to the owner and not executable" do
    @uploader.should have_permissions(0600)
  end

  it "should have a valid url" do
    @uploader.url.should eq "/uploads/stylish_rte/asset/image-175x55.png"
  end

end

#def your_action
#  uploader = @user.avatar
#  uploader.retrieve_from_store!(File.basename(@user.avatar.url))
#  uploader.cache_stored_file!

#  send_file uploader.file.path
#end

#CarrierWave.configure do |config|
#  config.cache_dir = "#{Rails.root}/tmp/upload"
#end
