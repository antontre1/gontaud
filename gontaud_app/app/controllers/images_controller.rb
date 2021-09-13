# permet de faire uploader une image
# on appelle carrierwave, avec en premier l'appel sur activerecord pour permettre l'accès à l'enregistrement des paths sur la bdd
require "carrierwave/orm/activerecord"
require "carrierwave"
#Configure Carrierwave
CarrierWave.configure do |config|
  config.root = "public/"
  # config.root = "/public"
end

class ImagesController < ApplicationController
  get '/recordimage' do
    if logged_in?
      erb :recordimage
    else
      redirect to '/'
    end
  end
  post '/recordimage' do
    if logged_in?
      @user = User.find_by_id(params[:id])
      #below twp lines in order to save the picture only, in the dedicated folder (set in application controller with 'Configure Carrierwave')
      # uploader = ImagesUploader.new
      # uploader.store!(params[:my_file])

      #below three lines to save simultaneously on the app and the path to the db
      imagetoload = Photo.new
      imagetoload.image = params[:my_file]
      imagetoload.save!
      redirect to '/accueil'
    else
      redirect to '/'
    end
  end
end
