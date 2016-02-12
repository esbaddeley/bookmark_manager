ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'

class BookmarkManager < Sinatra::Base

  enable :sessions
  set :session_secret, 'secretbookmark'
  set :method_override, true
  register Sinatra::Flash

  helpers do
    def current_user
      @current_user ||= User.get(session[:id])
    end

    def login_error
      flash.now[:signin_error] = 'Username or password was entered incorrectly'
      erb :signin
    end

    def check_signed_in
      redirect '/signup' unless session[:id]
    end
  end

  get '/' do
    redirect '/signin'
  end

  get '/signin' do
    erb :signin
  end

  post '/signin' do
    email = params['Email']
    password = params['Password']
    user = User.authenticate(email, password)
    if user
      session[:id] = user.id
      redirect '/links'
    else
      login_error
    end
  end

  get '/links' do
    check_signed_in
    @links = Link.all
    erb :links
  end

  get '/adding_links' do
    check_signed_in
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

  get '/tags/:category' do
    check_signed_in
    category = params[:category]
    tag = Tag.first(category: category)
    @links = tag ? tag.links : []
    erb :links
  end

  get '/signup' do
    erb :signup
  end

  post '/signup' do
    user = User.new(email: params['Email'], password_confirmation: 'Password_confirmation' )
    user.password = params['Password']
    user.password_confirmation = params['Password_confirmation']
    if user.save
      session[:id] = user.id
      redirect '/signup_confirmation'
    else
      flash.now[:errors] = user.errors.full_messages
      flash.now[:email] = params['Email']
      erb :signup
    end
  end

  get '/signup_confirmation' do
    erb :signup_confirmation
  end

  delete '/signout' do
    session.delete(:id)
    redirect '/signin'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
