require 'test_helper'

class ResidentTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @resident_type = resident_types(:one)
  end

  test "should get index" do
    get resident_types_url
    assert_response :success
  end

  test "should get new" do
    get new_resident_type_url
    assert_response :success
  end

  test "should create resident_type" do
    assert_difference('ResidentType.count') do
      post resident_types_url, params: { resident_type: { name: @resident_type.name } }
    end

    assert_redirected_to resident_type_url(ResidentType.last)
  end

  test "should show resident_type" do
    get resident_type_url(@resident_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_resident_type_url(@resident_type)
    assert_response :success
  end

  test "should update resident_type" do
    patch resident_type_url(@resident_type), params: { resident_type: { name: @resident_type.name } }
    assert_redirected_to resident_type_url(@resident_type)
  end

  test "should destroy resident_type" do
    assert_difference('ResidentType.count', -1) do
      delete resident_type_url(@resident_type)
    end

    assert_redirected_to resident_types_url
  end
end
