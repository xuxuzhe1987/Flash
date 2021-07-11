class UserDecksController < ApplicationController
  def index
    @user_decks = policy_scope(UserDeck)
    @user_decks = UserDeck.where(user_id: current_user.id)
    @user_cards = UserCard.where(user_id: current_user.id)
  end

  def create
    @deck = Deck.find(params[:deck_id])
    @user_decks = UserDeck.where(user_id: current_user.id)
    if @user_decks.select { |user_deck| user_deck.deck_id == @deck.id }.count.zero?
      @user_deck = UserDeck.new(user_deck_params)
      authorize @user_deck
      @user_deck.save
      redirect_to user_deck_path(@user_deck)
    else
      authorize @user_decks
      redirect_to user_deck_path(@user_decks.select { |user_deck| user_deck.deck_id == @deck.id })
    end
  end

  def show
    @user_deck = UserDeck.find(params[:id])
    authorize @user_deck
  end

  def update
  #   @user_card = UserCard.find(params[:card_id])
  #   @user_card.update(user_card_params)
  #   redirect_to deck_path(@card.deck_id)
  #   authorize @user_card
  end

  def destroy
    @user_deck = UserDeck.find(params[:id])
    authorize @user_deck
    @user_deck.destroy
    redirect_to user_decks_path
  end

  private

  def user_deck_params
    params.permit(:status, :deck_id, :user_id)
  end
end
