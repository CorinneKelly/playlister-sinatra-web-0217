class GenresController < ApplicationController
	get '/genres' do
		@all_genres = Genre.all
		erb :"genres/index"
	end


end