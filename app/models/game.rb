class Game < ApplicationRecord
    has_many :reviews, dependent: :destroy
    has_many :users, through: :reviews

    # Validations deliverables - Add validations to this model such that...
    # 1) All games have a title (cannot be empty / blank)
    # 2) No two games have the same title
    # 3) The game title is at least 4 characters long
    # 4) All games have a release_year (cannot be empty / blank)
    # 5) The release_year is between 1900 and 2023

    validates :title, presence: true, uniqueness: true, length: { minimum: 4 }
    validates :release_year, presence: true, inclusion: 1900..2023
end
