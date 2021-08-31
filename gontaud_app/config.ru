require './config/environment'


# if ActiveRecord::Migrator.needs_migration?
#   raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
# end

# use Rack::MethodOverride
# Rack::MethodOverride is a piece of Sinatra Middleware that intercepts every request run by our application. It will interpret any requests with name="_method" by translating the request to whatever is set by the value attribute—normally PATCH or DELETE for purposes in our Sinatra curriculum. This line must be placed in the config.ru file above all controllers in which you want access to the Middleware’s functionality.



# Dir[File.join(File.dirname(__FILE__), "app/controllers", "*.rb")].collect {|file| File.basename(file).split(".")[0] }.reject {|file| file == "application_controller" }.each do |file|
#   string_class_name = file.split('_').collect { |w| w.capitalize }.join
#   class_name = Object.const_get(string_class_name)
#   use class_name
# end
# In Lines 9 through 13, we’re mounting our controllers nested under app/controllers.
# These classes will also be loaded as Middleware. In this case, they’ll be use OwnersController and use PetsController.
# Notice how "application_controller" is rejected? That’s because it is called on in Line 14 below.



run ApplicationController
use UsersController
# This loads Rake tasks from the sinatra-activerecord gem. A custom Rake task is defined on Lines 8-10 which starts a new Pry session.