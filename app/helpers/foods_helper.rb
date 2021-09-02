module FoodsHelper
    def calorieSum(foods)
        totalCals = 0
            foods.each do |food|
                totalCals = totalCals + food.calories
            end
        return totalCals
    end
end

