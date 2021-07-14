class UserCardsController < ApplicationController
  def create
    @user_cards = UserCard.where(user_id: current_user.id)
    @card = Card.find(params[:card_id])
    # to ckeck if user_card exist? create or update
    if @user_cards.select { |user_card| user_card.card_id == @card.id }.count.zero?
      @user_card = UserCard.new(user_card_params)
      authorize @user_card
      @user_card.save
    else
      @user_card = @user_cards.select { |user_card| user_card.card_id == @card.id }.first
      authorize @user_card
      @user_card.update(user_card_params)
    end
  end

  private

  def user_card_params
    params.permit(:answer, :result, :card_id, :user_id)
  end
end
