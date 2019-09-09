require 'sinatra/base'
require_relative './lib/bookmarks'

class Bookmark_manager < Sinatra::Base

get '/' do
  $bookmarks = Bookmarks.new
  $bookmarks.add('www.fakepage.com')
  $bookmarks.add('www.testpage.com')
  erb :index
end

get '/bookmarks' do

  erb :bookmarks
end

run! if $PROGRAM_NAME == __FILE__
end
