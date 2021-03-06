class DecksController < ApplicationController
  before_action :set_deck, only: [:show, :edit, :update, :destroy]

  def index
    @decks = policy_scope(Deck)
    if params[:search].present?
      @decks = Deck.where("name ILIKE ?", "%#{params[:search]}%")
    else
      @decks = Deck.all
    end

    @my_decks = @decks.where(user_id: current_user.id)
    @lw_decks = @decks.where(user_id: 1)
  end

  def show
    @deck = Deck.find(params[:id])
    @user_decks = UserDeck.where(user_id: current_user.id)
    authorize @deck
  end

  def new
    @deck = Deck.new
    authorize @deck
  end

  def create
    @deck = Deck.new(deck_params)
    authorize @deck
    @deck.user = current_user
    @deck.save
    if params[:deck][:attachment].nil?
      redirect_to new_deck_card_path(@deck)
    else
      upload
      require 'csv'
      CSV.foreach(Rails.root.join('public', 'uploads', 'cards_import.csv'), headers: true) do |row|
        @card = Card.new(row.to_h)
        @card.deck = @deck
        @card.save
      end
      redirect_to decks_path
    end
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

  def upload
    uploaded_file = params[:deck][:attachment]
    File.open(Rails.root.join('public', 'uploads', uploaded_file.original_filename), 'wb') do |file|
      file.write(uploaded_file.read)
    end
  end
end
