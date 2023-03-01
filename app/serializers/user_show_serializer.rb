class UserShowSerializer < ActiveModel::Serializer
  attributes :id, :username

  has_many :reviews
  has_many :games
end
