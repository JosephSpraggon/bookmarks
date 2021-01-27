require 'sinatra/base'
require_relative "./lib/bookmark"

class BookmarkManager < Sinatra::Base

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

  run! if app_file == $0
end
