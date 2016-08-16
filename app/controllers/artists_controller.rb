class ArtistsController < ApplicationController

	get '/artists' do
		@artists = Artist.all
		erb :'/artists/index'
	end

	# get '/artists/new' do
	# 	erb :'/artists/new'
	# end

	# post '/artists' do
	# 	binding.pry
	# 	@artist = Artist.create(params)
	# 	unless params[:song][:artist].empty?
	# 		@song.artists << Artist.create(params[:song][:artist])
	# 		@song.save
	# 	end
	# 	@song = Song.create...
	# 	redirect to '/songs/#{@song.slug}'
	# end

	get '/artists/:slug' do
		# binding.pry
		@artist = Artist.find_by_slug(params[:slug])
		erb :'/artists/show'
	end	
end