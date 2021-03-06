Rails.application.routes.draw do
  devise_for :users
  root to: "rooms#index"
  resources :rooms, only: [:index, :new, :create, :edit, :update, :destroy] do
    collection do
      get 'search'
    end
    resources :messages, only: [:index, :create]
  end
end