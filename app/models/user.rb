class User < ApplicationRecord
    has_many :reviews, dependent: :destroy
    has_many :games, through: :reviews

    validates :username, presence: true, uniqueness: true
end
