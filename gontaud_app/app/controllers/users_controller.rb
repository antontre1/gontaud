class UsersController < ApplicationController

  # signup capability : a get and a post

  get '/signup' do
    erb :'users/signup'
  end

  post '/signup' do
    user = User.new(params)
    if !!User.find_by_email(params[:email]) ||  !!User.find_by_username(params[:username]) || user.username.blank? || user.email.blank? || user.password.blank? || user.fname.blank? || user.lname.blank? || user.ville.blank?

        redirect '/signup'
    else
        user.save
        session[:user_id] = user.id # very important part of login user with its session id
        redirect '/accueil'
    end
  end

  get '/login' do
    erb :'/index'
  end

  post '/login' do
    user = User.find_by_username(params[:username])
    if user && user.authenticate(params[:password]) && (user.validation === "OK")
      #login user
      session[:user_id] = user.id
      #redirect
      redirect '/accueil'
    elsif user && user.authenticate(params[:password]) && !(user.validation === "OK")
      flash[:error]= "**Inscritpion En attente de validation**"
      redirect '/login'
    else
      flash[:error]= "Invalid Login"
      redirect '/login'
      #use flash
    end
  end

get '/accueil' do
  if logged_in?
    @photos = Photo.all
    erb :'/tronc/accueil'
  else
    redirect to '/'
  end
end

get '/logout' do
  session.clear
  redirect '/'
end

end
