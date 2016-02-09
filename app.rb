require 'sinatra/base'
require 'link'
class BookmarkManager < Sinatra::Base

get '/links' do
  erb :links
end
run if app_file == $0
end
