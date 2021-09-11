# permet de faire uploader une image
class ImagesController < ApplicationController
  get '/recordimage' do
    erb :recordimage
  end
  post '/recordimage' do
    uploader = ImagesUploader.new
    uploader.store!(params[:my_file])
    redirect to '/'
  end
end

# u = User.new
# u.avatar = params[:file] # Assign a file like this, or

# # like this
# File.open('somewhere') do |f|
#   u.avatar = f
# end

# u.save!
# u.avatar.url # => '/url/to/file.png'
# u.avatar.current_path # => 'path/to/file.png'
# u.avatar_identifier # => 'file.png'
