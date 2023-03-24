class Review < ApplicationRecord
    belongs_to :game
    belongs_to :user

    validates :rating, presence: true, inclusion: 1..5
end
