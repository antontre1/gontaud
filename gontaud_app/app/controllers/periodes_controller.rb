
class PeriodesController < ApplicationController

get '/quivient' do
  if logged_in?
    @title = "Les visites prévues"
    toutesPeriodes = Periode.where(start_date: Date.today..(Date.today + 365))
    @matimeline = Array.new() {Array.new}
    toutesPeriodes.each do |p|
      @matimeline = @matimeline.push([p.visitor, p.start_date.to_s, p.end_date.to_s])
    end
    erb :'/tronc/quivient'
  else
    redirect to '/'
  end
end

get '/jeviens' do
  if logged_in?
    erb :'/tronc/jeviens'
  else
    redirect to '/'
  end
end

post '/jeviens' do
  if logged_in?
    periode = Periode.new
    periode.start_date = Date.new(params[:start_date].split(",")[2].to_i, params[:start_date].split(",")[1].to_i, params[:start_date].split(",")[0].to_i )
    periode.end_date = Date.new(params[:end_date].split(",")[2].to_i, params[:end_date].split(",")[1].to_i, params[:end_date].split(",")[0].to_i )
    periode.user_id = @current_user
    periode.visitor = params[:visitor]
    periode.comments = params[:comments]
    periode.save
    redirect to '/quivient'
  else
    redirect to '/'
  end
end


# get '/jechange/:user_id' do
#   if logged_in?
#     @matimeline = Periode.where(user_id: ))
#     erb :'/tronc/jechange'
#   else
#     redirect to '/'
#   end
# end

# post '/jechange/:user_id' do
#   if logged_in?
#     periode = Periode.new
#     periode.start_date = Date.new(params[:start_date].split(",")[2].to_i, params[:start_date].split(",")[1].to_i, params[:start_date].split(",")[0].to_i )
#     periode.end_date = Date.new(params[:end_date].split(",")[2].to_i, params[:end_date].split(",")[1].to_i, params[:end_date].split(",")[0].to_i )
#     periode.user_id = @current_user
#     periode.visitor = params[:visitor]
#     periode.comments = params[:comments]
#     periode.save
#     redirect to '/quivient'
#   else
#     redirect to '/'
#   end
# end


end
