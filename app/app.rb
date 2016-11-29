require 'sinatra/base'
require_relative './models/link.rb'

class BookmarkManager < Sinatra::Base
  get '/' do
    'Hello BookmarkManager!'
  end

  get '/links' do
  	@links = Link.entries
  	erb :links
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
