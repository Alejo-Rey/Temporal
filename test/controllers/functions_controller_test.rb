require 'test_helper'

class FunctionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @function = functions(:one)
  end

  test "should get index" do
    get functions_url, as: :json
    assert_response :success
  end

  test "should create function" do
    assert_difference('Function.count') do
      post functions_url, params: { function: { day: @function.day, movie: @function.movie, movie_id: @function.movie_id, num_chairs: @function.num_chairs } }, as: :json
    end

    assert_response 201
  end

  test "should show function" do
    get function_url(@function), as: :json
    assert_response :success
  end

  test "should update function" do
    patch function_url(@function), params: { function: { day: @function.day, movie: @function.movie, movie_id: @function.movie_id, num_chairs: @function.num_chairs } }, as: :json
    assert_response 200
  end

  test "should destroy function" do
    assert_difference('Function.count', -1) do
      delete function_url(@function), as: :json
    end

    assert_response 204
  end
end
