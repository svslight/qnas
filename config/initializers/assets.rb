# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = "1.0"

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
# Rails.application.config.assets.precompile += %w( admin.js admin.css )
# Rails.application.config.assets.paths << Rails.root.join('node_modules')

Rails.application.config.assets.precompile += %w( jquery.min.js jquery_ujs.js bootstrap.min.js popper.js )
Rails.application.config.assets.precompile += %w( controllers/index.js )
Rails.application.config.assets.precompile += %w( controllers/hello_controller.js )
Rails.application.config.assets.precompile += %w( custom/questions.js )
Rails.application.config.assets.precompile += %w( custom/votable.js )
Rails.application.config.assets.precompile += %w( custom/answers.js )
Rails.application.config.assets.precompile += %w( custom/add_link.js )
Rails.application.config.assets.precompile += %w( channels/questions.js )
Rails.application.config.assets.precompile += %w( channels/answers.js )
Rails.application.config.assets.precompile += %w( channels/comments.js )
Rails.application.config.assets.precompile += %w( channels/consumer.js )
Rails.application.config.assets.precompile += %w( channels/votable.js )
Rails.application.config.assets.precompile += %w( channels/add_link.js )
Rails.application.config.assets.precompile += %w( templates/answer.jst.skim )
Rails.application.config.assets.precompile += %w( templates/comment.jst.skim )
