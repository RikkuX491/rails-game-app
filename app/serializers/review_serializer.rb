class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :rating, :game

  #belongs_to :game
  belongs_to :user
end
