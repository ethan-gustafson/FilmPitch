source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.2', '>= 6.0.2.1'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
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

# dotenv loads environment variables from `.env`. Read more: https://github.com/bkeepers/dotenv
gem 'dotenv-rails'
# Devise - Flexible authentication solution for Rails with Warden. Read more: https://github.com/heartcombo/devise
gem 'devise'
# OmniAuth is a flexible authentication system utilizing Rack middleware. Read more: https://github.com/omniauth/omniauth
gem 'omniauth'
# OmniAuth strategy for Twitter. Read more: https://github.com/arunagw/omniauth-twitter
gem 'omniauth-twitter'
# Draper - Decorators/View-Models for Rails Applications. Read more: https://github.com/drapergem/draper
gem 'draper'
# The official AWS SDK for Ruby. Read more: https://github.com/aws/aws-sdk-ruby
gem "aws-sdk-s3", require: false
# Figaro parses a Git-ignored YAML file in your application and loads its values into ENV. Read more here: https://github.com/laserlemon/figaro
gem 'figaro'
# A Rails Engine for integrating with Stripe. Read more: https://github.com/tansengming/stripe-rails
gem 'stripe-rails'

# Use Active Storage variant
gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec-rails'
  gem 'capybara', '>= 2.15'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  # Bullet helps to kill N+1 queries and unused eager loading. Read more: https://github.com/flyerhzm/bullet
  gem 'bullet'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'selenium-webdriver'
  # Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
