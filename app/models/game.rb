class Game < ApplicationRecord
    has_many :reviews, dependent: :destroy
    has_many :users, through: :reviews

    belongs_to :game_store_owner

    validates :title, presence: true, uniqueness: true, length: { minimum: 4 }
    validates :release_year, presence: true, inclusion: 1900..2023
end
