class CardDetailsController < ApplicationController
  before_action :set_card_detail, only: [:show, :update, :destroy]
  # before_action :authorized

  # GET /card_details
  def index
    # @card_details = CardDetail.all
    @card_details = CardDetail.where user: @user.id

    render json: @card_details
  end

  # GET /card_details/1
  def show
    render json: @card_detail
  end

  # POST /card_details
  def create
    @card_detail = CardDetail.new(card_detail_params)
    @card_detail.user = @user

    if @card_detail.save
      render json: @card_detail, status: :created, location: @card_detail
    else
      render json: @card_detail.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /card_details/1
  def update
    if @card_detail.update(card_detail_params)
      render json: @card_detail
    else
      render json: @card_detail.errors, status: :unprocessable_entity
    end
  end

  # DELETE /card_details/1
  def destroy
    @card_detail.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_card_detail
      @card_detail = CardDetail.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def card_detail_params
      params.require(:card_detail).permit(:member_name, :string, :member_number, :string, :payer_name, :string, :plan_id, :string, :plan_name, :string, :rx_bin, :string, :rx_pcn, :string, :rx_group, :string, :dependents, :string, :start_date, :string, :card_specific_id, :string, :group_number, :string, :client_name, :string, :user, :references)
    end
end
