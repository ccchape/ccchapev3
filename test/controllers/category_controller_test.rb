require 'test_helper'

class CategoryControllerTest < ActionDispatch::IntegrationTest
  test "should get prodigio" do
    get category_prodigio_url
    assert_response :success
  end

  test "should get junior" do
    get category_junior_url
    assert_response :success
  end

  test "should get senior" do
    get category_senior_url
    assert_response :success
  end

end
