class Band < ApplicationRecord
  validates :name, presence: true

  has_many :albums,
  primary_key: :id,
  foreign_key: :artist_id,
  class_name: :Album,
  dependent: :destroy

  has_many :tracks,
    through: :albums,
    source: :tracks
end
