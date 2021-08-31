class UsersController < ApplicationController

  # signup capability : a get and a post

  get '/signup' do
    erb :'users/signup'
  end

  post '/signup' do
    user = User.new(params)

    if user.username.blank? || user.email.blank? || user.password.blank?
        redirect '/signup'
    else
        user.save
        redirect '/'
    end
  end

end

