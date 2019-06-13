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
    tags = params[:tags].split(", ")
    tags.each { |tag| bookmark.tags << Tag.first_or_create(name: tag) }
    bookmark.save
    redirect '/bookmarks'
  end
end
