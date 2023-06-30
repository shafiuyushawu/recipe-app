Rails.application.routes.draw do
  devise_for :users
  root "foods#index"
  resources :recipes, only: [:index, :show, :new, :create, :destroy] do
    resources :ingredients, only: [:new, :create, :destroy]
  end
  resources :foods, only: [:new, :create, :destroy]
  resources :shopping_list, only: [:index]
  resources :public_recipes, only: [:index]
end
