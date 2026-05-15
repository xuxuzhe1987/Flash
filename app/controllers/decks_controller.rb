class DecksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_deck, only: [:show, :edit, :update, :destroy]

  def index
    @decks = policy_scope(Deck)
    
    if params[:search].present?
      @decks = @decks.where("name ILIKE ?", "%#{params[:search]}%")
    end

    @my_decks = @decks.where(user_id: current_user.id).order(created_at: :desc)
  end

  def show
    authorize @deck
    @cards = @deck.cards.order(created_at: :desc)
    @user_deck = UserDeck.find_or_initialize_by(user: current_user, deck: @deck)
  end

  def new
    @deck = Deck.new
    authorize @deck
  end

  def create
    @deck = Deck.new(deck_params)
    @deck.user = current_user
    authorize @deck

    unless @deck.save
      render :new, alert: 'Failed to create deck. Please try again.' and return
    end

    if params[:deck][:attachment].is_a?(ActionDispatch::Http::UploadedFile)
      csv_result = process_csv_upload
      if csv_result == :error
        return
      end
    end

    redirect_to @deck, notice: 'Deck created successfully!'
  end

  def edit
    authorize @deck
  end

  def update
    if @deck.update(deck_params)
      redirect_to @deck, notice: 'Deck updated successfully!'
    else
      render :edit, alert: 'Failed to update deck. Please try again.'
    end
  end

  def destroy
    authorize @deck
    deck_name = @deck.name
    @deck.destroy
    redirect_to decks_path, notice: "#{deck_name} has been deleted."
  end

  private

  def deck_params
    params.require(:deck).permit(:name, :attachment)
  end

  def set_deck
    @deck = Deck.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to decks_path, alert: 'Deck not found.' and return
  end

  def process_csv_upload
    uploaded_file = params[:deck][:attachment]
    return unless uploaded_file.is_a?(ActionDispatch::Http::UploadedFile)

    begin
      csv_path = Rails.root.join('tmp', "cards_#{Time.current.to_i}.csv")
      File.open(csv_path, 'wb') do |file|
        file.write(uploaded_file.read)
      end

      cards_created = 0
      CSV.foreach(csv_path, headers: true) do |row|
        question = row['question'].to_s.strip
        answer = row['answer'].to_s.strip
        next if question.blank? && answer.blank?

        @deck.cards.create!(question: question, answer: answer)
        cards_created += 1
      end

      File.delete(csv_path) if File.exist?(csv_path)
      Rails.logger.info "Created #{cards_created} cards for deck #{@deck.id}"
      :success
    rescue CSV::MalformedCSVError => e
      Rails.logger.error "CSV parsing error: #{e.message}"
      redirect_to @deck, alert: 'Invalid CSV format. Please check your file.'
      :error
    rescue => e
      Rails.logger.error "CSV upload error: #{e.message}"
      redirect_to @deck, alert: "Failed to import cards: #{e.message}"
      :error
    end
  end
end