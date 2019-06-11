ENV["RACK_ENV"] ||= "development"

require_relative 'data_mapper_setup'
require 'sinatra/base'

class BookmarkManager < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :'bookmarks/index'
  end

  get '/bookmarks/new' do
    erb :'bookmarks/new'
  end

  post '/bookmarks' do
    bookmark = Bookmark.create(url: params[:url], title: params[:title])
    tag = Tag.first_or_create(name: params[:tags])
    bookmark.tags << tag
    bookmark.save
    redirect '/bookmarks'
  end

  get '/tags/:name' do
    tag = Tag.first(name: params[:name])
    @bookmarks = tag ? tag.bookmarks : []
    erb :'bookmarks/index'
  end

  run! if app_file == $0
end
