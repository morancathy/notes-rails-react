require 'test_helper'

class CardDetailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @card_detail = card_details(:one)
  end

  test "should get index" do
    get card_details_url, as: :json
    assert_response :success
  end

  test "should create card_detail" do
    assert_difference('CardDetail.count') do
      post card_details_url, params: { card_detail: { card_specific_id: @card_detail.card_specific_id, client_name: @card_detail.client_name, dependents: @card_detail.dependents, group_number: @card_detail.group_number, member_name: @card_detail.member_name, member_number: @card_detail.member_number, payer_name: @card_detail.payer_name, plan_id: @card_detail.plan_id, plan_name: @card_detail.plan_name, references: @card_detail.references, rx_bin: @card_detail.rx_bin, rx_group: @card_detail.rx_group, rx_pcn: @card_detail.rx_pcn, start_date: @card_detail.start_date, string: @card_detail.string, user: @card_detail.user } }, as: :json
    end

    assert_response 201
  end

  test "should show card_detail" do
    get card_detail_url(@card_detail), as: :json
    assert_response :success
  end

  test "should update card_detail" do
    patch card_detail_url(@card_detail), params: { card_detail: { card_specific_id: @card_detail.card_specific_id, client_name: @card_detail.client_name, dependents: @card_detail.dependents, group_number: @card_detail.group_number, member_name: @card_detail.member_name, member_number: @card_detail.member_number, payer_name: @card_detail.payer_name, plan_id: @card_detail.plan_id, plan_name: @card_detail.plan_name, references: @card_detail.references, rx_bin: @card_detail.rx_bin, rx_group: @card_detail.rx_group, rx_pcn: @card_detail.rx_pcn, start_date: @card_detail.start_date, string: @card_detail.string, user: @card_detail.user } }, as: :json
    assert_response 200
  end

  test "should destroy card_detail" do
    assert_difference('CardDetail.count', -1) do
      delete card_detail_url(@card_detail), as: :json
    end

    assert_response 204
  end
end
