require './config/environment'
require 'sysrandom/securerandom'
require "carrierwave/orm/activerecord"
require "carrierwave"


#Configure Carrierwave
CarrierWave.configure do |config|
  config.root = File.dirname(__FILE__) + "/public"
end


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



end
