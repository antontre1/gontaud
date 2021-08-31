class UserController < ApplicationController

  # signup capability : a get and a post

  get '/signup' do
    erb :'users/signup'
  end

  get '/post' do
  
  end

end