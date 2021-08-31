pour lancer l'application, vu qu'il y a un fichier de type config.ru :
bundle exec rackup

Utilisation de :
ruby 2.7.2
activerecord 6.1

attention à bien utiliser les recommandation de Sinatra ActiveRecord Extension données ici https://www.rubydoc.info/gems/sinatra-activerecord/2.0.23/file/README.md
il s'agit de bien mettre :

Note that in modular Sinatra applications you will need to first register the extension:

class YourApplication < Sinatra::Base
register Sinatra::ActiveRecordExtension
end
