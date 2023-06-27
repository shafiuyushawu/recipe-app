class FoodsController < ApplicationController
  def index 
    @foods = Food.all
  end

  def new 
    @foods = Food.new
  end
end
