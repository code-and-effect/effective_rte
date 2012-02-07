StylishRte::Engine.routes.draw do
  resources :assets, :only => [:new, :create]
end

#Rails.application.routes.draw do
#  scope "/stylish_rte", :module => "stylish_rte" do
#    resources :assets
#  end
#end
