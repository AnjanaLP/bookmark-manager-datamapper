class BookmarkManager < Sinatra::Base

  get '/tags/:name' do
    tag = Tag.first(name: params[:name])
    @bookmarks = tag ? tag.bookmarks : []
    erb :'bookmarks/index'
  end
end
