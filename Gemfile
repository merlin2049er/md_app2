# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

 ruby '2.7.2'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.2', '>= 6.0.2.1'

# use Postgres on Heroku production and localhost
gem 'pg'

# Use Puma as the app server
gem 'puma', '~> 4.1'
# Use SCSS for stylesheets
gem 'sass-rails', '>= 6'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 4.0'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

# sprockets
gem 'sprockets-rails', require: 'sprockets/railtie'

# fonts
gem 'fontawesome-rails', '~> 4.0', '>= 4.0.3.2'

# breadcrumbs
gem 'breadcrumbs_on_rails'

# devise for authentication
gem 'devise', '~> 4.2'

# for forms
gem 'simple_form'

# for pagination
gem 'pagy', '~> 3.7', '>= 3.7.3'

# populator
# gem 'populator', '~> 1.0'
gem 'populator', github: 'fulvi0/populator'

# validates timelines
gem 'validates_timeliness', '~> 5.0.0.alpha3'

# omniauth
gem 'omniauth'
# for facebook authentication
gem 'omniauth-facebook'

# Log impressions from controller actions or from a model
gem 'impressionist', '~> 1.6', '>= 1.6.1'

# country country_select
gem 'country_select'

# validations
gem 'client_side_validations', '~> 17.2'
gem 'client_side_validations-simple_form', '~> 11.2'


# elasticsearch
gem 'elasticsearch-model', github: 'elastic/elasticsearch-rails', branch: '5.x'
gem 'elasticsearch-rails', github: 'elastic/elasticsearch-rails', branch: '5.x'

gem 'sentry-raven'

gem 'cocoon'

# gem 'stripe', '~> 5.12'
gem 'stripe'
# used to handle stripe webhooks
gem 'stripe_event'

gem 'toastr_rails'

# Simple authorization solution
#gem 'cancan', '~> 1.6', '>= 1.6.10'
gem 'cancancan'

gem 'auto-session-timeout'

gem 'commontator', '~> 6.3'

# image gallery for product photos
gem 'photoswipe-rails', '~> 4.1', '>= 4.1.2'

#gem 'react-rails'

# for sitemap generation
gem 'sitemap_generator'

# sluging it out
gem 'friendly_id', '~> 5.2.4' # NOTE: You MUST use 5.0.0 or greater for Rails 4.0+

gem 'heroku-deflater', group: :production

gem 'hotwire-rails'
gem 'turbo-rails'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
end

group :development do
  # for fake data
  gem 'faker'
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  #gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'listen', '~> 3.3', '>= 3.3.3'

  gem 'web-console', '>= 3.3.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  # Use sqlite3 as the database for Active Record
  # gem 'sqlite3', '~> 1.4'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'brakeman', require: false
  gem 'bundler-audit', '~> 0.7.0.1', require: false
  # gem 'fasterer', '~> 0.8.3', require: false  'no rails 3.0.0 compatible version'
  gem 'meta_request'
  gem 'pry-rails'
  gem 'rails_best_practices', '~> 1.20'
  gem 'reek', '~> 6.0', '>= 6.0.2'
  # Ruby static code analyze [linter]
  gem 'rubocop', require: false
  # make the code look pretty
  gem 'prettier'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  # Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
