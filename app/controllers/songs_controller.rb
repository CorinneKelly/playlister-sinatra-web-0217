require 'rack-flash'


class SongsController < ApplicationController
enable :sessions
use Rack::Flash

	# include Slug

	get '/songs' do
		@all_songs = Song.all
		erb :"songs/index"
	end

	get '/songs/new' do
		erb :"songs/new"
	end

	get '/songs/:slug' do
		@song = Song.find_by_slug(params[:slug])
		erb :"songs/show"
	end

	post '/songs' do
		@song = Song.create(name: params["Name"])
		@song.artist = Artist.find_or_create_by(name: params["Artist Name"])
		params[:genres].each do |genre|
			@song.genres << Genre.find(genre)
		end
		@song.save

		flash[:message] = "Successfully created song."

		redirect to "/songs/#{@song.slug}"
	end

	get '/songs/:slug/edit' do
		@song = Song.find_by_slug(params[:slug])
		erb :"songs/edit"
	end

	patch '/songs/:slug/edit' do
		@song = Song.find_by_slug(params[:slug])
		@song.artist = Artist.find_or_create_by(name: params["artist_name"])
		@song.name = params["Name"]
		@song.save
		flash[:message] = "Successfully updated song."
		redirect to "/songs/#{@song.slug}"
	end


end

# changed songs index.erb to link to @song.slug