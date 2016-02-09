require 'sinatra/base'
require 'link'

class BookmarkManager < Sinatra::Base

  get '/links' do
    @links = Link.all
    erb :links
  end

  get '/links/new' do
    erb :add_link
  end

  post '/links' do
    @name = params['Name']
    @url = params['URL']
    Link.create(name: @name, url: @url)
    redirect '/links'
  end



run if app_file == $0
end
