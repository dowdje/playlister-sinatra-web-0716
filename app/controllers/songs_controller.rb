class SongsController < ApplicationController

	get '/songs' do
		@songs = Song.all
		erb :'/songs/index'
	end

	get '/songs/new' do
		erb :'/songs/new'
	end

	post '/songs' do
		# binding.pry
		@song = Song.create(params[:song])
		if !params[:artist].empty?
			@song.artist_id = Artist.create(params[:artist]).id
			@song.save
		end
		if !params[:genre].empty?
			@genre_id = Genre.create(params[:genre]).id
		end
		@songgenre = SongGenre.create(song_id: @song.id, genre_id: @genre_id || params[:songgenre])
		# @song = Song.create...
		redirect to '/songs/#{@song.slug}'
	end

	get '/songs/:slug' do
		# binding.pry
		@song = Song.find_by_slug(params[:slug])
		erb :'/songs/show'
	end	
end