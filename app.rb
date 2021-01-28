require 'sinatra/base'
require_relative "./lib/bookmark"

class BookmarkManager < Sinatra::Base

  enable :sessions, :method_override

  get '/' do
    erb :index
  end

  get '/add_bookmark' do
    erb :add_bookmark
  end

  get "/bookmarks" do
    @bookmarks = Bookmark.all
    erb :bookmarks
  end

  post '/bookmarks' do
    Bookmark.create(url: params[:url], title: params[:title])
    redirect ('/bookmarks')
  end

  delete '/bookmarks/:id' do
    Bookmark.delete(id: params[:id])
    redirect '/bookmarks'
  end

  get '/bookmarks/:id/edit' do
    @bookmark = Bookmark.find(id: params[:id])
    erb :'bookmarks/edit'
  end

  patch '/bookmarks/:id' do
    Bookmark.update(id: params[:id], title: params[:title], url: params[:url])
    redirect('/bookmarks')
  end

  run! if app_file == $0
end
