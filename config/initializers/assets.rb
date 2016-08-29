# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

Rails.application.config.assets.precompile += %w( hometeam.scss )
Rails.application.config.assets.precompile += %w( team_page/owl.carousel.css )
Rails.application.config.assets.precompile += %w( hometeam.coffee )
Rails.application.config.assets.precompile += %w( team_page/hometeamscript.js )

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )

#Pero tengo un error, es que no quiero implementar todos los javascripts y css de la página de presentación del equipo en el proyecto final, para ello creé un archivo en la carpeta de los javascripts (intentando copiar la de application) .js y en la carpeta de los stylesheets un archivo .scss (de la misma forma, intentando copiar el application.css) para hacer el require de los archivos que voy a implementar...
#Sin embargo me aparece que debo
