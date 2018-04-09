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
    erb :signup
  end

  get '/tweets' do
    erb :tweets
  end

  post '/signup' do
    binding.pry
    if !params[:username].empty? && !params[:email].empty? && !params[:password].empty?
      redirect '/tweets'
    else
      redirect '/signup'
    end
    #if the user tries to signup without a user name, redirect them back to the signup page

  end

end
