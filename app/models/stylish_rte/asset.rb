module StylishRte
  class Asset < ActiveRecord::Base

    belongs_to :assetable, :polymorphic => true

    mount_uploader :data, AssetUploader

    def attachable_type=(sType)
       super(sType.to_s.classify.constantize.base_class.to_s)
    end

  end
end
