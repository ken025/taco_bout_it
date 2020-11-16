class Restaurant < ApplicationRecord
    validates :name, presence: true, uniqueness: true
    validates :location, presence: true

    has_many :reviews, dependent: :destroy
    has_many :users, through: :reviews

    accepts_nested_attributes_for :reviews

    def self.search(search)
        if search 
           @restaurant  = Restaurant.find_by(location: search)
            if @restaurant  
                self.where(location: search)
            else 
                Restaurant.all
            end 
        else 
            Restaurant.all
        end 
    end 
end 
