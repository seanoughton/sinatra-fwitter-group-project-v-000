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
    #if a user is logged in then you redirect them to tweets
    erb :signup
  end

  get '/tweets' do
    erb :tweets
  end

  post '/signup' do
    if !params[:username].empty? && !params[:email].empty? && !params[:password].empty?
      redirect '/tweets'
    else
      redirect '/signup'
    end
  end

  helpers do
    def logged_in?
      #returns true of there is a user_id in the session_secret
      #and false if there is not
      !!session[:user_id]
    end
  end

end
