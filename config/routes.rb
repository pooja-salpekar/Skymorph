Skymorph::Application.routes.draw do

  root :to => 'image#index'

  resources :image do
    collection do
      get :new
      post :find
    end
  end
end
