class RecipesController < ApplicationController
    def index
        @recipes = current_user.recipes.all
    end

    def show
        @recipe = Recipe.find(params[:id])
    end
end
