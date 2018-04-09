require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "password_security"
  end

  get '/' do
    erb :index
  end

  get  '/signup' do
    if !logged_in? #if not logged in
      erb :signup
    else
      erb :tweets
    end
  end

  get '/tweets' do
    erb :tweets
  end

  post '/signup' do
    if !params[:username].empty? && !params[:email].empty? && !params[:password].empty?
      redirect '/tweets'
    else
      binding.pry
      redirect '/signup'
    end
  end

  helpers do
    def logged_in?
      #returns true if logged in
      !session[:user_id]
    end
  end

end
