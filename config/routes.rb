Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :decks, only: [:show] do
    resources :cards, only: [:show, :update] do
      resources :user_cards, only: [:update]
    end
  end


end
