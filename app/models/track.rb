class Track < ApplicationRecord
  validates :album_id, :title, presence: true


  belongs_to :album,
    primary_key: :id,
    foreign_key: :track_id,
    class_name: :Album

  has_one :artist,
    through: :album,
    source: :artist
end
