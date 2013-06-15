Skymorph::Application.routes.draw do

  root :to => 'image_urls#index'

  resources :image_urls do
    get :new
  end
end
