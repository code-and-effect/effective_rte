module StylishRte
  class AssetsController < ActionController::Base
    respond_to :html, :xml, :js

    def new
      @asset = Asset.new
      respond_with(@asset)
    end

    def create
      # This is a create method for use with uplodify
      @asset = Asset.new(:data => params[:Filedata])

      if @asset.save
        render :text => "#{@asset.id}"
      else
        render :text => "error"
      end
    end

    def index
      @assets = Asset.all
      respond_with(@assets)
    end

    def show
      @asset = Asset.find(params[:id])
      respond_with @asset
    end

    def destroy
      @asset = Asset.find(params[:id])
      @asset.destroy
      respond_with(@asset)
    end

    def insert_asset_into_editor
      @asset = Asset.find(params[:id])
      @htmlarea = params[:htmlarea]
      respond_to { |format| format.js }
    end

    def show_asset_for_editor
      @asset = Asset.find(params[:id])
      @htmlarea = params[:htmlarea]
      respond_with @asset
    end
  end
end
