class ShoppingListController < ApplicationController
  def index 
    @current_user = current_user 
    @foods = []
    @total_price = 0
    flag = 0

    current_user.recipes.includes([:foods]).each do |recipe| 
      recipe.foods.each do |food| 
        qty = RecipeFood.find_by(food_id: food.id).quantity
        f = current_user.foods.find(food.id)
        if(f.quantity - q).negative? && flag
          @foods << {
            name: f.name,
            quantity: f.quantity - 1,
            price: f.price * (f.quantity - 1)
          }
        end
      end
    end
    @foods.each { |f| @total_price += f[:price] }
    @foods
  end

  def check_for_duplicate(foods, food, quantity) 
    foods.each do |food_item| 
      next unless food_item[:name] == food.name

      food_item[:quantity] = food_item[:quantity] - quantity 
      food_item[:price] = food_item[:quantity] * food.price
      return false 
    end
  end
end