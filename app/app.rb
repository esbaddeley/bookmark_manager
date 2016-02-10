ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require './app/models/link'
require 'data_mapper'
require 'dm-postgres-adapter'

class BookmarkManager < Sinatra::Base

  get '/' do
    redirect ('/links')
  end

  get '/links' do
    @links = Link.all
    erb :links
  end

  get '/adding_links' do
    erb :adding_links
  end

  post '/links' do
    Link.create(url: params['URL'], name: params['Name'])
    redirect ('/links')
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
