ENV["RACK_ENV"] ||= "development"

require_relative 'data_mapper_setup'
require 'sinatra/base'

class BookmarkManager < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

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
    tags = params[:tags].split(", ")
    tags.each { |tag| bookmark.tags << Tag.first_or_create(name: tag) }
    bookmark.save
    redirect '/bookmarks'
  end

  get '/tags/:name' do
    tag = Tag.first(name: params[:name])
    @bookmarks = tag ? tag.bookmarks : []
    erb :'bookmarks/index'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    user = User.create(email: params[:email],
                       password: params[:password],
                       password_confirmation: params[:password_confirmation])
    session[:user_id] = user.id
    redirect '/bookmarks'
  end

  run! if app_file == $0
end
