class RecipesController < ApplicationController
    def index
        @recipes = current_user.recipes.all
    end

    def show
        @recipe = Recipe.find(params[:id])
    end

    def new
        @recipe = Recipe.new
    end

    def create
        @recipe = current_user.recipes.new(recipe_params)

        if @recipe.save
            redirect_to recipes_path, notice: 'Recipe created successfully'
        else
            flash.now[:alert] = 'Unable to create a recipe'
            render :new
        end
    end

    def destroy
        @recipe = Recipe.find(params[:id])
        @recipe.destroy
        redirect_to recipes_path, notice: 'Recipe successfully deleted'
    end

    private
    def recipe_params
        params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public)
    end
end
