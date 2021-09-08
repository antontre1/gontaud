require './config/environment'
require 'sysrandom/securerandom'

class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, ENV.fetch('SESSION_SECRET') { SecureRandom.hex(64) }
    # binding.pry
    register Sinatra::Flash
  end


  get '/' do
    erb :index
  end

  get '/signup' do
    erb :"users/signup"
  end



end
