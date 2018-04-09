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
    redirect '/tweets'
  end

end
