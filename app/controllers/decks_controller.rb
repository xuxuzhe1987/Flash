class DecksController < ApplicationController
  before_action :set_deck, only: [:show, :edit, :update, :destroy]

  def index
    @decks = policy_scope(Deck)
  end

  def show
    @deck = Deck.find(params[:id])
    authorize @deck
  end

  def new
    @deck = Deck.new
    authorize @deck
  end

  def create
    @deck = Deck.new(deck_params)
    @deck.save
    redirect_to new_deck_card_path(@deck)
    authorize @deck
  end

  def edit
    @deck = Deck.find(params[:id])
    authorize @deck
  end

  def update
    @deck.update(deck_params)
    redirect_to deck_path(@deck)
    authorize @deck
  end

  def destroy
    @deck.destroy
    redirect_to decks_path
    authorize @deck
  end

  private

  def deck_params
    params.require(:deck).permit(:name)
  end

  def set_deck
    @deck = Deck.find(params[:id])
  end
end
