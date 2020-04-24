source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

#ruby '2.7.0'
ruby '2.7.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.2', '>= 6.0.2.1'
# Use sqlite3 as the database for Active Record
# gem 'sqlite3', '~> 1.4'

# use Postgres on Heroku production and localhost
#gem 'pg', '~> 1.1', '>= 1.1.3'
gem 'pg'

# Use Puma as the app server
gem 'puma', '~> 4.1'
# Use SCSS for stylesheets
gem 'sass-rails', '>= 6'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 4.0'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
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
gem 'sprockets-rails', :require => 'sprockets/railtie'

#fonts
gem 'fontawesome-rails', '~> 4.0', '>= 4.0.3.2'


# breadcrumbs
gem 'breadcrumbs_on_rails'

#devise for authentication
gem 'devise', '~> 4.2'

# for forms
gem "simple_form"

# for pagination
gem 'pagy', '~> 3.7', '>= 3.7.3'

# for fake data
gem 'faker'

#populator
#gem 'populator', '~> 1.0'
gem 'populator', :github => 'fulvi0/populator'

#validates timelines
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
gem 'client_side_validations', '~> 16.1', '>= 16.1.1'
gem 'client_side_validations-simple_form', '~> 10.0'

# elasticsearch
gem 'elasticsearch-model', github: 'elastic/elasticsearch-rails', branch: '5.x'
gem 'elasticsearch-rails', github: 'elastic/elasticsearch-rails', branch: '5.x'

gem "sentry-raven"

gem "cocoon"

gem 'stripe', '~> 5.12'

gem 'toastr_rails'

#Simple authorization solution
gem 'cancan', '~> 1.6', '>= 1.6.10'

gem 'auto-session-timeout'

gem 'commontator', '~> 6.3'

#image gallery for product photos
gem 'photoswipe-rails', '~> 4.1', '>= 4.1.2'


group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  # Use sqlite3 as the database for Active Record
  # gem 'sqlite3', '~> 1.4'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'meta_request'
  gem 'pry-rails'

end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  # Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
