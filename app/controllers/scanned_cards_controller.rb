class ScannedCardsController < ApplicationController
  before_action :set_scanned_card, only: [:show, :update, :destroy]
  before_action :authorized

  # GET /scanned_cards
  def index
    @scanned_cards = ScannedCard.where user: @user.id

    render json: @scanned_cards
  end

  # GET /scanned_cards/1
  def show
    render json: @scanned_card
  end

  # POST /scanned_cards
  def create
    @scanned_card = ScannedCard.new(scanned_card_params)
    @scanned_card.user = @user

    if @scanned_card.save
      render json: @scanned_card, status: :created, location: @scanned_card
    else
      render json: @scanned_card.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /scanned_cards/1
  def update
    if @scanned_card.update(scanned_card_params)
      render json: @scanned_card
    else
      render json: @scanned_card.errors, status: :unprocessable_entity
    end
  end

  # DELETE /scanned_cards/1
  def destroy
    @scanned_card.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_scanned_card
      @scanned_card = ScannedCard.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def scanned_card_params
      params.require(:scanned_card).permit(:patient, :paying_company, :user_id)
    end
end
