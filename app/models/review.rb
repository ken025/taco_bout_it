class Review < ApplicationRecord
    validates :message, presence: true
    validates :stars, presence: true
    
    belongs_to :user
    belongs_to :restaurant
end
