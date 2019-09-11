require 'sinatra/base'
require_relative './lib/bookmarks'

class Bookmark_manager < Sinatra::Base
  enable :sessions, :method_override

get '/' do
  erb :index
end

get '/bookmarks' do
  @bookmarks = Bookmarks.all
  erb :bookmarks
end

post '/bookmarks/new' do
  Bookmarks.create(title: params[:title], url: params[:url])
  redirect '/bookmarks'
end

delete '/bookmarks/:id' do
  Bookmarks.delete(id: params[:id])
  redirect '/bookmarks'
end

run! if $PROGRAM_NAME == __FILE__
end
