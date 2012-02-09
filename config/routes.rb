#StylishRte::Engine.routes.draw do
#  resources :assets #, :only => [:new, :create]
#end

Rails.application.routes.draw do
  scope "/stylish_rte", :module => "stylish_rte" do
    resources :assets
    match "assets/insert_asset_into_editor/:id/:htmlarea", :to => "assets#insert_asset_into_editor", :via => :get, :as => "insert_asset_into_editor"
    match "assets/show_asset_for_editor/:id/:htmlarea", :to => "assets#show_asset_for_editor", :via => :get, :as => "show_asset_for_editor"
  end
end
