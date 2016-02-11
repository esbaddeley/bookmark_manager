ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'data_mapper_setup'
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
    tag = Tag.create(category: params['Tag'])
    link = Link.create(url: params['URL'], name: params['Name'])
    LinkTag.create(link: link, tag: tag)
    redirect ('/links')
  end

  # get '/tags' do
  #
  # end

  # post '/tags' do
  #
  # end

  get '/tags/:category' do
    category = params[:category]
    tag = Tag.first(category: category)
    @links = tag ? tag.links : []
    erb :links
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
