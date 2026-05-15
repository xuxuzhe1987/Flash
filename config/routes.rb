Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: "callbacks" }
  root to: 'pages#home'

  get "download_csv", to: "pages#download_csv", as: :download_csv

  resources :decks do
    resources :cards, only: [:new, :create]
  end

  resources :cards, except: [:new, :create]

  resources :user_cards, only: [:create]

  resources :user_decks do
    member do
      post :learn
    end
  end

end