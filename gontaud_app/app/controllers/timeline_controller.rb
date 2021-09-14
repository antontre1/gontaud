
class TimelineController < ApplicationController

get '/quivient' do
    @title = "Timeline"
    @matimeline = [
        ["Pauline", "2021-08-04", "2021-08-15"],
        ["Antonin", "2021-08-04", "2021-08-29"],
        ["Emilie", "2021-08-01", "2021-08-21"]
      ]
    erb :quivient
end

end
