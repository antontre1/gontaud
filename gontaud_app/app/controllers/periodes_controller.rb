
class PeriodesController < ApplicationController

get '/quivient' do
  if logged_in?
    @title = "Timeline"

    toutesPeriodes = Periode.all

  # <% @photos.each do |p| %>
  #   <img src="<%= p.image.url %>" class="monimage" width="200px" alt="monimage">
  # <% end %>
  @matimeline = Array.new() {Array.new}
  toutesPeriodes.each do |p|
   @matimeline = @matimeline.push([p.visitor, p.start_date.to_s, p.end_date.to_s])
  end

    # @matimeline = [
    #     ["Pauline", "2021-08-04", "2021-08-15"],
    #     ["Pauline", "2021-09-01", "2021-09-12"],
    #     ["Antonin", "2021-08-04", "2021-08-29"],
    #     ["Emilie", "2021-08-01", "2021-08-21"]
    #   ]

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

end
