Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :requests do
    resources :documents, only: [:new, :create]
  end
  resources :documents, only: [:index, :update, :destroy] do
    member do
      patch :valide
      patch :refuse
    end
  end
end