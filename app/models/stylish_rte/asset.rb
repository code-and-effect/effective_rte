class StylishRte::Asset < ActiveRecord::Base
  belongs_to :assetable, :polymorphic => true

  mount_uploader :asset, StylishRte::AssetUploader

  def attachable_type=(sType)
     super(sType.to_s.classify.constantize.base_class.to_s)
  end
end
