class FoodsController < ApplicationController
  def index
    @foods = Food.all
  end

  def show
    @food = Food.find(params[:id])
  end

  def new
    @food = Food.new
  end

  def create
    @food = Food.new(name: "...", calories: 10)

    if @food.save
      redirect_to @food
    else
      render :new
    end
  end

  def edit
    @food = Food.find(params[:id])
  end

  def update
    @food = Food.find(params[:id])

    if @food.update(food_params)
      redirect_to @food
    else
      render :edit
    end
  end

  private
    def food_params
      params.require(:food).permit(:name, :calories)
    end
end