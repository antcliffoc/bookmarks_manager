require 'sinatra/flash'
require 'sinatra/base'
require './lib/bookmarks'
require './database_connection_setup'
require 'uri'

class Bookmark_manager < Sinatra::Base
  enable :sessions, :method_override
  register Sinatra::Flash

get '/' do
  erb :index
end

get '/bookmarks' do
  @bookmarks = Bookmarks.all
  erb :bookmarks
end

post '/bookmarks/new' do
  flash[:notice] = 'You must submit a valid URL.' unless Bookmarks.create(title: params[:title], url: params[:url])
  redirect '/bookmarks'
end

delete '/bookmarks/:id' do
  Bookmarks.delete(id: params[:id])
  redirect '/bookmarks'
end

get '/bookmarks/:id/edit' do
  @bookmark = Bookmarks.find(id: params[:id])
  erb :'bookmarks/edit'
end

patch '/bookmarks/:id' do
  Bookmarks.update(id: params[:id], title: params[:title], url: params[:url])
  redirect '/bookmarks'
end

run! if $PROGRAM_NAME == __FILE__
end
