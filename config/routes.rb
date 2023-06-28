Rails.application.routes.draw do
  root "foods#index"


  # Defines the root path route ("/")
  # root "articles#index"
  resources :recipes, only: [:index, :show, :new, :create, :destroy]

  resources :foods, only: [:new, :create, :destroy]
  resources :shopping_list, only: [:index]
end
