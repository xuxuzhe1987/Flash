class UserDecksController < ApplicationController
  def create
    @user_deck = UserDeck.new(user_deck_params)
    authorize @user_deck
    @user_deck.save
    redirect_to user_deck_path(@user_deck)
  end

  def show
    @user_deck = UserDeck.find(params[:id])
    authorize @user_deck
  end

  private

  def user_deck_params
    params.permit(:status, :deck_id, :user_id)
  end
end
