require 'httparty'
require 'json'

class RecipesController < ApplicationController

  # POST /recipes/search
  def search
    @recipes = get_20_api(params[:title])
    render :index
  end


  # GET /recipes
  # GET /recipes.json
  def index
    @recipes = get_20_api("")
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def recipe_params
      params.require(:recipe).permit(:title)
    end

    def get_20_api(title)
      recipes10 = JSON.parse(HTTParty.get("http://www.recipepuppy.com/api/?q=#{title}"))["results"]
      recipes20 = JSON.parse(HTTParty.get("http://www.recipepuppy.com/api/?q=#{title}&p=2"))["results"]
      (recipes10 << recipes20).flatten!
    end
end
