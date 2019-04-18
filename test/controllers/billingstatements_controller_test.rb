require 'test_helper'

class BillingstatementsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @billingstatement = billingstatements(:one)
  end

  test "should get index" do
    get billingstatements_url
    assert_response :success
  end

  test "should get new" do
    get new_billingstatement_url
    assert_response :success
  end

  test "should create billingstatement" do
    assert_difference('Billingstatement.count') do
      post billingstatements_url, params: { billingstatement: { date: @billingstatement.date, description: @billingstatement.description, statement_num: @billingstatement.statement_num, total: @billingstatement.total } }
    end

    assert_redirected_to billingstatement_url(Billingstatement.last)
  end

  test "should show billingstatement" do
    get billingstatement_url(@billingstatement)
    assert_response :success
  end

  test "should get edit" do
    get edit_billingstatement_url(@billingstatement)
    assert_response :success
  end

  test "should update billingstatement" do
    patch billingstatement_url(@billingstatement), params: { billingstatement: { date: @billingstatement.date, description: @billingstatement.description, statement_num: @billingstatement.statement_num, total: @billingstatement.total } }
    assert_redirected_to billingstatement_url(@billingstatement)
  end

  test "should destroy billingstatement" do
    assert_difference('Billingstatement.count', -1) do
      delete billingstatement_url(@billingstatement)
    end

    assert_redirected_to billingstatements_url
  end
end
