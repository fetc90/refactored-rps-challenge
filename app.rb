require 'sinatra/base'

class RPS < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end

  post '/name' do
    # saving name to session so we can retreive it later
    session[:name] = params[:name]
    redirect '/play'
  end

  get '/play' do
    # creating attr to use in play.erb
    @name = session[:name]
    @shape = session[:shape]
    @opponent_shape = session[:opponent_shape]
    erb :play
  end

  post '/play' do
    session[:shape] = params[:shape]
    session[:opponent_shape] = :rock
    redirect '/play'
  end

  # start the server if ruby file executed directly
  #run! if app_file == $0
end
