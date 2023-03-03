class User < ApplicationRecord
    has_many :reviews, dependent: :destroy
    has_many :games, through: :reviews

    validates :username, presence: true, uniqueness: true

    # A macro for bcrypt that will take the user's password, encrypt it, and then save the encrypted password to the database when a new user is created
    has_secure_password
end
