ENV['SINATRA_ENV'] ||= "development"
# cette ligne est également présente dans le fichier : environment.rb
# In most of the labs in this section, this will be the first line of your Rakefile.
# This means that if "SINATRA_ENV" doesn’t already have a value, its value will be set equal to "development".


require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'])
# On Lines upon we require our gems and dependencies. Line 3 finds our Gemfile and makes all the gems contained within
# (plus their dependencies) available to Ruby by adding them to the load path. On Line 4,
# we’re requiring all of our gems (:default represents all gems since we didn’t create
# gem groups for this app) as well as our deployment environment hash to be used with the Active Record gem.




ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => "db/#{ENV['SINATRA_ENV']}.sqlite"
)
# we establish our database connection. Our adapter sets the name of the database 
# management system (typed in all lower-case) that we’re using to hold our data and 
# our database sets the path to our app’s database. This path includes our deployment environment hash, 
# which is an argument of Bundle.require on Line 4 and will change based on our key’s value, pointing to other databases.


require './app/controllers/application_controller'
require_all 'app'
