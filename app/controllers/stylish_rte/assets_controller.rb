module StylishRte
  class AssetsController < ActionController::Base
    respond_to :html, :xml, :js

    layout 'asset_frame'

    def new
      @asset = Asset.new
      respond_with(@asset)
    end

    def create
      @asset = Asset.new(params[:asset])
      if @asset.save
        flash[:notice] = "Successfully created asset."
      else
        flash[:error] = "Unable to create the asset"
      end

      respond_with(@asset)
    end

    def index
      @assets = Asset.all
      respond_with(@assets)
    end

    def show
      @asset = Asset.find(params[:id])
      respond_with @asset
    end

    def insert_asset_into_editor
      @asset = Asset.find(params[:id])
      @htmlarea = params[:htmlarea]
      respond_to { |format| format.js }
    end
  end
end
