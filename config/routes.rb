Rails.application.routes.draw do
  scope "/stylish_rte", :module => "stylish_rte" do
    resources :assets
  end
end
