Skymorph::Application.routes.draw do

  root :to => 'image#index'

  resources :image do
    get :new
  end
end
