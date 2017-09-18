require 'test_helper'

class RecipesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @recipe = recipes(:one)
  end

  test "should get index" do
    get recipes_url
    assert_response :success
    assert_select "title", "Recipe finder"
  end

  test "should get search" do
    get search_recipes_path
    assert_response :success
    assert_select "title", "Recipe finder"
  end

  test "should post search" do
    post search_recipes_path, params: {title: "omelet"}, headers: {}
    assert_response :success
    assert_equal "text/html", @response.content_type
    assert_select "tr", 21   #table row for header and for 20 recipes
  end

  test "can search for recipes after index" do
    get "/"
    assert_response :success
   
    post "/recipes/search", params: { title: "omelet" }
    assert_response :success
    assert_select "tr", 21   #table row for header and for 20 recipes
    assert_select "title", "Recipe finder"
  end
end
