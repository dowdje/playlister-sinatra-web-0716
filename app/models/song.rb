
class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :genres, through: :song_genres
  has_many :song_genres

  def slug
    self.name.slugify
  end
  
  def self.find_by_slug(slug)
    self.all.detect {|element| element.name.slugify == slug}
  end
end