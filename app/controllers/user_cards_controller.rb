class UserCardsController < ApplicationController
  before_action :authenticate_user!

  def create
    card = Card.find(params[:card_id])
    
    existing_card = UserCard.find_by(user_id: current_user.id, card_id: card.id)
    
    if existing_card
      existing_card.update(result: params[:result])
      user_deck = existing_card.user_deck
    else
      user_card = UserCard.new(
        user_id: current_user.id,
        card_id: card.id,
        user_deck_id: params[:user_deck_id],
        result: params[:result]
      )
      authorize user_card
      user_card.save
      user_deck = user_card.user_deck
    end
    
    redirect_to user_deck_path(user_deck)
  end

  private

  def user_card_params
    params.permit(:user_deck_id, :answer, :result, :card_id, :user_id)
  end
end
