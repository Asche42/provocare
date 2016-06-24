require 'test_helper'

class OffersControllerTest < ActionController::TestCase
  setup do
    @offer = offers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:offers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create offer" do
    assert_difference('Offer.count') do
      post :create, offer: { company_id: @offer.company_id, content: @offer.content, created_on: @offer.created_on, date_from: @offer.date_from, date_to: @offer.date_to, titre: @offer.titre, type: @offer.type, updated_on: @offer.updated_on, user_id: @offer.user_id }
    end

    assert_redirected_to offer_path(assigns(:offer))
  end

  test "should show offer" do
    get :show, id: @offer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @offer
    assert_response :success
  end

  test "should update offer" do
    patch :update, id: @offer, offer: { company_id: @offer.company_id, content: @offer.content, created_on: @offer.created_on, date_from: @offer.date_from, date_to: @offer.date_to, titre: @offer.titre, type: @offer.type, updated_on: @offer.updated_on, user_id: @offer.user_id }
    assert_redirected_to offer_path(assigns(:offer))
  end

  test "should destroy offer" do
    assert_difference('Offer.count', -1) do
      delete :destroy, id: @offer
    end

    assert_redirected_to offers_path
  end
end
