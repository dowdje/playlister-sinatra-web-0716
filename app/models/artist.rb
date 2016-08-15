class Artist < ActiveRecord::Base
  has_many :genres, through: :songs
  has_many :songs

  def slug
    self.name.slugify
  end

  def self.find_by_slug(slug)
    self.all.detect {|element| element.name.slugify == slug}
  end
end