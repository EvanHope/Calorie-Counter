class CounterController < ApplicationController
  def index
    @food = Food.all
  end
end
