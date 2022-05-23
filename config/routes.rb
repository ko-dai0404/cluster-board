Rails.application.routes.draw do
  devise_for :users
  root to: "rooms#index"
  resources :rooms, only: [:index, :new] do
    collection do
      get 'search'
    end
  end
end
