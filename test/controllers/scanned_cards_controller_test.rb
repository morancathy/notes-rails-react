require 'test_helper'

class ScannedCardsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @scanned_card = scanned_cards(:one)
  end

  test "should get index" do
    get scanned_cards_url, as: :json
    assert_response :success
  end

  test "should create scanned_card" do
    assert_difference('ScannedCard.count') do
      post scanned_cards_url, params: { scanned_card: { patient: @scanned_card.patient, paying_company: @scanned_card.paying_company, string: @scanned_card.string, user_id: @scanned_card.user_id } }, as: :json
    end

    assert_response 201
  end

  test "should show scanned_card" do
    get scanned_card_url(@scanned_card), as: :json
    assert_response :success
  end

  test "should update scanned_card" do
    patch scanned_card_url(@scanned_card), params: { scanned_card: { patient: @scanned_card.patient, paying_company: @scanned_card.paying_company, string: @scanned_card.string, user_id: @scanned_card.user_id } }, as: :json
    assert_response 200
  end

  test "should destroy scanned_card" do
    assert_difference('ScannedCard.count', -1) do
      delete scanned_card_url(@scanned_card), as: :json
    end

    assert_response 204
  end
end
