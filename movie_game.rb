require 'sinatra'
# require 'sinatra/reloader' if development?
require 'imdb'
require 'awesome_print'
require 'pry'

enable :sessions

get'/' do
	erb :movie_homepage	
end

post '/results' do 
	#save keywordsto session hash by
  	session[:search_keywords] = params[:search_keywords]
  	redirect to ('/search_results')
end 

get '/search_results' do 
	@search = Imdb::Search.new(session[:search_keywords])
	#movie array
	@movies = @search.movies 
	@nine_movies = @movies[0..8]
	erb :search_results
end 





