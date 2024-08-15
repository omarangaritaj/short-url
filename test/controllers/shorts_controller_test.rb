require "test_helper"

class ShortsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @short = shorts(:one)
  end

  test "should get index" do
    get shorts_url, as: :json
    assert_response :success
  end

  test "should create short" do
    assert_difference("Short.count") do
      post shorts_url, params: { short: {  } }, as: :json
    end

    assert_response :created
  end

  test "should show short" do
    get short_url(@short), as: :json
    assert_response :success
  end

  test "should update short" do
    patch short_url(@short), params: { short: {  } }, as: :json
    assert_response :success
  end

  test "should destroy short" do
    assert_difference("Short.count", -1) do
      delete short_url(@short), as: :json
    end

    assert_response :no_content
  end
end
