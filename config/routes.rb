Rails.application.routes.draw do
  devise_for :users
  root "items#index"
  resources :items, except: [:index] do
    resources :purchases, only: [:new, :create]
  end
end
