class UsersController < ApplicationController

  # signup capability : a get and a post

  get '/signup' do
    erb :'users/signup'
  end

  post '/signup' do
    binding.pry
    user = User.new(params)
  end

end

