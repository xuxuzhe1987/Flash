class CardsController < ApplicationController
  before_action :set_card, only: [:edit, :update, :destroy]
  before_action :set_deck, only: [:new, :create]

  def index
    @cards = policy_scope(Card)
    # @cards = Card.all
  end

  def new
    @card = Card.new
    authorize @card
  end

  def create
    @card = Card.new(card_params)
    authorize @card
    @card.deck = @deck
    # authorize @deck
    @card.save
    if @card.save
      redirect_to new_deck_card_path(@deck)
    else
      render.new
    end
  end

  def edit
    authorize @card
  end

  def update
    @card.update(card_params)
    redirect_to deck_path(@card.deck_id)
    authorize @card
  end

  def destroy
    @card.destroy
    redirect_to deck_path(@card.deck_id)
  end

  private

  def card_params
    params.require(:card).permit(:question, :answer, :hint)
  end

  def set_card
    @card = Card.find(params[:id])
  end

  def set_deck
    @deck = Deck.find(params[:deck_id])
  end
end
