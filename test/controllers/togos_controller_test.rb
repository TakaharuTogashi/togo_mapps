require 'test_helper'

class TogosControllerTest < ActionController::TestCase
  setup do
    @togo = togos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:togos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create togo" do
    assert_difference('Togo.count') do
      post :create, togo: { address: @togo.address, latitude: @togo.latitude, longitude: @togo.longitude, memo: @togo.memo, place: @togo.place }
    end

    assert_redirected_to togo_path(assigns(:togo))
  end

  test "should show togo" do
    get :show, id: @togo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @togo
    assert_response :success
  end

  test "should update togo" do
    patch :update, id: @togo, togo: { address: @togo.address, latitude: @togo.latitude, longitude: @togo.longitude, memo: @togo.memo, place: @togo.place }
    assert_redirected_to togo_path(assigns(:togo))
  end

  test "should destroy togo" do
    assert_difference('Togo.count', -1) do
      delete :destroy, id: @togo
    end

    assert_redirected_to togos_path
  end
end
