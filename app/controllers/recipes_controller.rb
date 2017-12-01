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
      first = HTTParty.get("#{ENV['RECIPE_API_URL']}?q=#{title}")
      recipes10 = JSON.parse(first)["results"] if first.response.code == "200"
      second = HTTParty.get("#{ENV['RECIPE_API_URL']}?q=#{title}&p=2")
      recipes20 = JSON.parse(second)["results"] if second.response.code == "200"
      if recipes10 && recipes20
        return (recipes10 << recipes20).flatten! 
      else
        return recipes10
      end
    end
end
