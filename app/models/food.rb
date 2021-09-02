class Food < ApplicationRecord
    validates :name, presence: true
    validates :calories, numericality: { only_integer: true }
end
