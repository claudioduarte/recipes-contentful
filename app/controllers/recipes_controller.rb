class RecipesController < ApplicationController
  before_action :set_recipe, only: :show
  before_action :set_content_type, only: :index

  def index
    @recipes = Recipe.render_all(@content_type)
  end

  def show
    @description = RDiscount.new(@recipe.description)
  end

  private

  def set_recipe
    @recipe = Recipe.render(recipe_params[:id])
  end

  def set_content_type
    @content_type = 'recipe'
  end

  def recipe_params
    params.permit(:id)
  end
end
