class GameShowSerializer < ActiveModel::Serializer
  attributes :id, :title, :release_year

  has_many :reviews
  has_many :users
end
