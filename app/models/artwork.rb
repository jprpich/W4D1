# == Schema Information
#
# Table name: artworks
#
#  id         :bigint(8)        not null, primary key
#  title      :string
#  image_url  :string
#  artist_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Artwork < ApplicationRecord
  validates :title, presence: true
  validates :title, uniqueness: { scope: :artist_id} 

  belongs_to :artist,
    foreign_key: :artist_id,
    class_name: :User

  has_many :artwork_shares,
    foreign_key: :artwork_id,
    class_name: :ArtworkShare

  has_many :shared_viewers,
    through: :artwork_shares,
    source: :viewer
end
