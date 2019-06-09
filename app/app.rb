require 'data_mapper'
require 'dm-postgres-adapter'
require 'sinatra/base'
require './app/models/bookmark'

class BookmarkManager < Sinatra::Base

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :'bookmarks/index'
  end

  run! if app_file == $0
end
