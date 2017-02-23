class ArtistsController < ApplicationController

	get '/artists' do
		@all_artists = Artist.all
		erb :"artists/index"
	end

end