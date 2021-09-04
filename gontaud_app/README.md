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

Gestion de SESSION: (cf https://github.com/learn-co-curriculum/sinatra-mechanics-of-sessions-readme et https://rubydoc.info/gems/sinatra#using-sessions)
pour la gestion des cookies, une sécurité est à ajouter avec la génération de nombre aléatoire RNG (Random Numb Generator).
On utilise pour cela la gem securerandom. On ajoute dans le fichier app (application_controller):
require 'sysrandom/securerandom'
set :session_secret, ENV.fetch('SESSION_SECRET') { SecureRandom.hex(64) }

ceci permet la génération dans le :session_secret d'un nombre aleatoire de 64hex (soit 512 bits).
