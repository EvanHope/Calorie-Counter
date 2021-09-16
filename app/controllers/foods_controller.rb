class FoodsController < ApplicationController
  before_action :authenticate_user!

  def index
    @current_user_id = current_user.id
    @foods = Food.where(userid: @current_user_id)
  end

  def show
    @food = Food.find(params[:id])
    #if @food.userid != @current_user_id #checks if food user is trying to view is connected to users id
    #  redirect_to root_path #TODO: Show error message that food doesnt exisit
    #else
    #end
  end

  def new
    @food = Food.new
  end

  def create
    @food = Food.new(name: params[:food][:name], calories: params[:food][:calories], userid: current_user.id)

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
