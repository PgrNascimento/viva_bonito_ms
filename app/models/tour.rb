class Tour < ApplicationRecord

  validates :name, :description, :category, :attraction, :duration, :adult_price,
            :child_price, :baby_price, :distance, presence: true

end
