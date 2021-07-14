Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: "callbacks" }
  root to: 'pages#home'

  resources :decks do
    resources :cards, only: [:new, :create]
  end

  resources :cards, except: [:new, :create]

  resources :user_cards, only: [:create]

  resources :user_decks, only: [:index, :create, :show, :destroy, :update]

end
