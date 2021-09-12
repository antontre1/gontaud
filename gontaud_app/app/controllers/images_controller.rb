# permet de faire uploader une image

require "carrierwave/orm/activerecord"
require "carrierwave"
#Configure Carrierwave
CarrierWave.configure do |config|
  config.root = File.dirname(__FILE__) + "/public"
end

class ImagesController < ApplicationController
  get '/recordimage' do
    erb :recordimage
  end
  post '/recordimage' do
    #below twp lines in order to save the picture only, in the dedicated folder (set in application controller with 'Configure Carrierwave')
    # uploader = ImagesUploader.new
    # uploader.store!(params[:my_file])

    #below three lines to save simultaneously on the app and the path to the db
    imagetoload = Photo.new
    imagetoload.image = params[:my_file]
    imagetoload.save!
    redirect to '/'
  end
end
