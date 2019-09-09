require 'sinatra/base'
require_relative './lib/bookmarks'

class Bookmark_manager < Sinatra::Base

get '/' do
  erb :index
end

get '/bookmarks' do
  @bookmarks = Bookmarks.all
  erb :bookmarks
end

run! if $PROGRAM_NAME == __FILE__
end
