Rails.application.routes.draw do
  root "foods#index"

  resources :foods, only: [:new, :create]
end
