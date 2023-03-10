source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.7.0"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 7.0.4"

# The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem "sprockets-rails"

# Use postgresql as the database for Active Record
gem "pg", "~> 1.1"

# Use the Puma web server [https://github.com/puma/puma]
gem "puma", "~> 5.0"

# Use JavaScript with ESM import maps [https://github.com/rails/importmap-rails]
gem "importmap-rails"

# Use Sass to process CSS
# gem "sassc-rails"

# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
# gem 'webpacker', '~> 4.0'

# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
# gem 'turbolinks', '~> 5'

# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem "turbo-rails"

# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem "stimulus-rails"

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem "jbuilder"

# Use Redis adapter to run Action Cable in production
gem "redis", "~> 4.0"

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false
gem 'slim-rails'
# gem 'slim', '~> 5.0'
gem 'sprockets', '3.6.3'

# Helper for creating declarative interfaces in controllers
gem 'decent_exposure', '3.0.0'

# Аутентификация - процесс проверки, имеет ли пользователь в приложениио логин/пароль
gem 'devise'
# Авторизация - управляет правами, имеет ли данный залогиненный польз-ль право выполнять то или иное действие в приложении
gem 'cancancan'

gem 'jquery-rails'
gem 'bootstrap', '~> 4.2.1'
gem "sassc-rails"
gem 'aws-sdk-s3', require: false

# Dynamic nested forms using jQuery made easy; works with formtastic, simple_form or default forms
gem 'cocoon'

gem "octokit", "~> 4.0"
gem 'octicons_helper'

gem 'faraday-retry'
gem "net-http"

# Get your Rails variables in your js
gem 'gon'
gem 'skim', '~> 0.10.0'

# Библиотека предоставляет универальный интерфейс доступа к любым провайдерам открытой аутентификации
gem 'omniauth'
# Gem для каждого конкретного провайдера
gem 'omniauth-github'
gem 'omniauth-linkedin-oauth2', '~> 1.0'
gem "omniauth-rails_csrf_protection", '~> 1.0'

# Gem Позволяет сделать приложение Провайдером OAuth
gem 'doorkeeper'
# Библиотека реализует патерн Сериалайзера - для преобразования объектов в нужный формат Json (хэш) или XML
gem 'active_model_serializers', '~> 0.10.0'
# Gem для увеличения скорости преообразования объектов и хешей в JSON
gem 'oj'

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
  gem 'rspec-rails', '~> 4.0.1'
  gem 'factory_bot_rails'
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem "web-console"
  gem 'listen', '~> 3.2'

  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  # gem "rack-mini-profiler"

  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  gem "spring", '~> 4.1'
  # gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
  gem 'shoulda-matchers'
  gem 'rails-controller-testing'
  gem 'launchy'
end
