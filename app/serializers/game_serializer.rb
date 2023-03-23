class GameSerializer < ActiveModel::Serializer
  attributes :id, :title, :release_year

  belongs_to :game_store_owner
end
