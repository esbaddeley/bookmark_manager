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
    tags = params['Tag'].downcase.gsub(' ','').split(",")
    link = Link.create(url: params['URL'], name: params['Name'])
    tags.each do |tag|
      LinkTag.create(link: link, tag: Tag.create(category: tag))
    end
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
