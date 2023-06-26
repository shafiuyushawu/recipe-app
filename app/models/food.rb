class Food < ApplicationRecord
    belongs_to :user
    validates :name, :measurement_unit, :price, :quantity, presence: true
    validates :price, :quantity, numericality: { greater_than_or_equal_to: 0 }
    validates :quantity, numericality: {only_integer: true}
end