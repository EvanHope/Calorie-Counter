class FoodsController < ApplicationController
  before_action :authenticate_user!

  #Index shows all foods with the same userid as the current user
  def index
    @current_user_id = current_user.id
    @foods = Food.where(userid: @current_user_id)
  end

  #shows individual foods based on food id (can be made more secure by ensuring the user id is the same aswell)
  def show
    @food = Food.find(params[:id])
  end

  def new
    @food = Food.new
  end

  #Creates a new food using the form submitted by user
  def create

    @food = Food.new(name: params[:food][:name], calories: params[:food][:calories], userid: current_user.id)

    if @food.save
      redirect_to @food
    else
      render :new
    end
  end

  #edits food object based on info submited in the form by the user
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

  def destroy
    @food = Food.find(params[:id])
    @food.destroy

    redirect_to root_path
  end

  private
    def food_params
      params.require(:food).permit(:name, :calories, :userid)
    end
end
