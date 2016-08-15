class Song < ActiveRecord::Base
	belongs_to :artist
	# belongs_to :genre
	has_many :genres, through: :song_genres
	has_many :song_genres

	def slug
		self.name.slugify
	end

	def self.find_by_slug(slug)
		self.all.detect do |song|
			song.name.slugify == slug
		end
	end 

end