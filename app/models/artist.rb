require 'slugify'

class Artist < ActiveRecord::Base
	has_many :songs
	has_many :genres, through: :songs

	def slug
		self.name.slugify
	end

	def self.find_by_slug(slug)
		self.all.detect do |song|
			song.name.slugify == slug
		end
	end
	
end