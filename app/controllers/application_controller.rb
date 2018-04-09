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

  get '/signup' do
    if !logged_in?
      erb :signup
    else
      redirect '/tweets'
    end

  end

  get '/tweets' do
    erb :tweets
  end

  post '/signup' do
    if params[:username].empty? || params[:email].empty? || params[:password].empty?
      redirect to '/signup'
    else
      @user = User.create(username: params[:username], email: params[:email], password: params[:password])
      @user.save
      session[:user_id] = @user.id
      redirect to '/tweets'
    end
  end

  helpers do
    def logged_in?
      #returns true if logged in
      !!session[:user_id]
      #!!current_user #if there  is a current user returns true
=begin
      if session[:user_id]
        true
      else
        false
      end
=end
    end

    def current_user
      #tests to see if there is a session param called :user_id
      #if there is one, that means that a user was created and saved to the database
      #if so, this uses the find method on User to find that user instance
      if session[:user_id]
        @current_user = User.find(session[:user_id])
      end
    end
  end

end
