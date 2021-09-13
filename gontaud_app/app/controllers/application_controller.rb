require './config/environment'
require 'sysrandom/securerandom'


class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    set :root, File.dirname(__FILE__)
    enable :sessions
    set :session_secret, ENV.fetch('SESSION_SECRET') { SecureRandom.hex(64) }
    # binding.pry
    register Sinatra::Flash
      #Configure Sinatra
    set :root,      File.dirname(__FILE__)
  end


  get '/' do
    erb :index
  end

  get '/signup' do
    erb :"users/signup"
  end

helpers do
  def current_user  #return the logged user
    @current_user ||= User.find_by_id(session[:user_id]) #memorization
  end
  #check if a user is logged in
  def logged_in?
    !!session[:user_id]
  end
end

end
