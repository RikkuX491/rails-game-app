class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :rating

  belongs_to :game
  belongs_to :user
end
