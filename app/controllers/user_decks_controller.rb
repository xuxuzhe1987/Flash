class UserDecksController < ApplicationController
  before_action :authenticate_user!

  def index
    @user_decks = UserDeck.where(user_id: current_user.id)
    @user_cards = UserCard.where(user_id: current_user.id)
  end

  def create
    deck = Deck.find(params[:deck_id])
    
    existing_deck = UserDeck.find_by(user_id: current_user.id, deck_id: deck.id)
    
    if existing_deck
      redirect_to user_deck_path(existing_deck, card_index: 0)
    else
      @user_deck = UserDeck.new(user_id: current_user.id, deck_id: deck.id, status: 0)
      authorize @user_deck
      if @user_deck.save
        redirect_to user_deck_path(@user_deck, card_index: 0)
      else
        redirect_to deck_path(deck), alert: 'Failed to start studying.'
      end
    end
  end

  def show
    @user_deck = UserDeck.find(params[:id])
    authorize @user_deck
    
    card_index = params[:card_index].to_i
    all_cards = @user_deck.deck.cards
    total_cards = all_cards.count
    
    if card_index >= total_cards
      @completed = true
      @current_card = nil
      @progress = {
        known: @user_deck.user_cards.where(result: true).count,
        learning: @user_deck.user_cards.where(result: false).count,
        total: total_cards
      }
    else
      @completed = false
      @current_card = all_cards[card_index]
      @next_index = card_index + 1
      @progress = {
        current: card_index + 1,
        total: total_cards
      }
    end
  end

  def learn
    @user_deck = UserDeck.find(params[:id])
    
    card_id = params[:card_id].to_i
    result = params[:result] == 'true'
    next_index = params[:next_index].to_i
    
    existing = @user_deck.user_cards.find_by(card_id: card_id)
    
    if existing
      existing.update(result: result)
    else
      @user_deck.user_cards.create(
        card_id: card_id, 
        result: result,
        user_id: current_user.id
      )
    end
    
    redirect_to user_deck_path(@user_deck, card_index: next_index)
  end

  def destroy
    @user_deck = UserDeck.find(params[:id])
    authorize @user_deck
    @user_deck.destroy
    redirect_to user_decks_path, notice: 'Study progress deleted.'
  end
end