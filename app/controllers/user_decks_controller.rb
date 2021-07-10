class UserDecksController < ApplicationController

  def index
    @user_decks = policy_scope(UserDeck)
    @user_decks = UserDeck.where(user_id: current_user.id)
  end

  def new
    @user_deck = UserDeck.new
    authorize @user_deck
  end

  def create
    @user_deck = UserDeck.new(user_deck_params)
    authorize @user_deck
    @user_deck.save
    redirect_to user_deck_path(@user_deck[:id])
  end

  def show
    @user_deck = UserDeck.find(params[:id])
    authorize @user_deck
  end

  def destroy
    @user_deck = UserDeck.find(params[:id])
    authorize @user_deck
    @user_deck.destroy
    redirect_to user_decks_path
  end

  private

  def user_deck_params
    params.permit(:name, :attachment, :status, :deck_id, :user_id)
  end
end
