class FoodsController < ApplicationController
  before_action :authenticate_user!
  def index
    @foods = Food.includes(:user).where(users: { id: current_user.id })
    puts
  end

  def new
    @food = Food.new
  end

  def create
    puts current_user.id
    @food = Food.new(
      name: food_params[:name],
      measurement_unit: food_params[:measurement_unit],
      price: food_params[:price],
      quantity: food_params[:quantity],
      user_id: current_user.id
    )

    if @food.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def destroy
    @food = Food.find(params[:id])
    @food.destroy

    flash[:notice] = 'Food deleted successfully'
    redirect_back(fallback_location: root_path)
  end

  private

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price, :quantity)
  end
end
