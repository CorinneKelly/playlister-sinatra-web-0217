class ArtistsController < ApplicationController

	get '/artists' do
		@all_artists = Artist.all
		erb :"artists/index"
	end

	get '/artists/:slug' do
		@artist = Artist.find_by_slug(params[:slug])	
		erb :"artists/show"	
	end

	# post '/artists/:slug' do
	# 	@artist = Artist.find_by_slug(params[:slug])
	# 	redirect to "artists/#{@artist.slug}"
	# end

end