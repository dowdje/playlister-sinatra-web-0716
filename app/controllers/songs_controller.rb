class SongsController < ApplicationController

	get '/songs' do
		@songs = Song.all
		erb :'/songs/index'
	end

	get '/songs/new' do
		erb :'/songs/new'
	end

	post '/songs' do
		@song = Song.create(name: params[:song][:name])

		unless params[:artist].empty?
			if Artist.all.detect {|artist| artist.name == params[:artist][:name]}
				@song.artist = Artist.find_by(name: params[:artist][:name])
			else
			@song.artist = Artist.create(params[:artist])
		end
			@song.save
		end
		unless params[:genre][:name].empty?
			@song.genres << Genre.create(params[:genre])
			@song.save
		end
		unless params[:songgenre].empty?
			params[:songgenre].each do |genre_id|
			@song.genres << Genre.find(genre_id[:genre_id])
		end
			@song.save
		end
		# binding.pry
			# @song = Song.create...
		@message = "Successfully created song."

		redirect to "/songs/#{@song.slug}?message=#{@message}"
	end

	get '/songs/:slug' do
		# binding.pry
		if params[:message]
			@message = params[:message]
		end
		@song = Song.find_by_slug(params[:slug])
		erb :'/songs/show'
	end	
end