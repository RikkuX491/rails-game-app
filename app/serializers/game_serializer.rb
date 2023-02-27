class GameSerializer < ActiveModel::Serializer
  attributes :id, :title, :release_year
end
