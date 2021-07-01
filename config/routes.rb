Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :decks do
    resources :cards, only: [:new, :create]
  end

  resources :cards, except: [:new, :create]

  resources :user_cards, only: [:update]

end
