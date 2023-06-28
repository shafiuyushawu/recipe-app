class IngredientsController < ApplicationController
    def new
        @recipe_food = RecipeFood.new
        @foods = Food.all
        @recipe = params[:recipe_id]
    end
    
    def create
        @food = Food.find(params[:recipe_food][:food_id])
        @recipe = Recipe.find(params[:recipe_id])
        @quantity = params[:recipe_food][:quantity]

        @ingredient = RecipeFood.new(quantity:@quantity, recipe: @recipe, food: @food)
    
        if @ingredient.save
          redirect_to recipe_path(@recipe), notice: 'Ingredient added successfully'
        else
          flash.now[:alert] = 'Unable to add an igredient'
          render :new
        end
    end

    def destroy
      @recipe = Recipe.find(params[:recipe_id])
      @food = @recipe.foods.find(params[:food_id])
      @ingredient = RecipeFood.where(food_id: @food)
      @ingredient[0].destroy
      redirect_to recipe_path(@recipe), notice: 'Ingredient Successfully deleted'
    end
end
