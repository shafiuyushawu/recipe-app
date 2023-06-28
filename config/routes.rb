Rails.application.routes.draw do
  root "foods#index"


  # Defines the root path route ("/")
  # root "articles#index"
  resources :recipes, only: [:index, :show, :new, :create, :destroy] do
    resources :ingredients, only: [:new, :create]
  end
  resources :foods, only: [:new, :create, :destroy]
end
