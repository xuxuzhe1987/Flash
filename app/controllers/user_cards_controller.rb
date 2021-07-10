class UserCardsController < ApplicationController
  def create
    @user_card = UserCard.new(user_card_params)
    authorize @user_card
    @user_card.save
  end

  def update
  end

  private

  def user_card_params
    params.permit(:answer, :result, :card_id, :user_id)
  end
end
