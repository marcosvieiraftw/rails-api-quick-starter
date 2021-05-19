source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.5'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.1'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# Use Puma as the app server
gem 'puma', '~> 4.3'
# Use Active Model has_secure_password
gem 'bcrypt', '~> 3.1.13'
# Seamless JWT authentication for Rails API
gem 'knock', '~> 2.1.1'
# Explicit soft deletion for ActiveRecord via deleted_at and default scope
gem 'soft_deletion', '~> 1.5.0'
# A lightning fast JSON:API serializer for Ruby Objects.
gem 'fast_jsonapi', '~> 1.5'
# Minimal authorization through OO design and pure Ruby classes
gem 'pundit', '~> 2.1.0'
# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem 'rack-cors'
# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false
# The ultimate pagination ruby gem
gem 'pagy', '~> 3.6.0'

group :development, :test do
  gem 'dotenv-rails'
  gem 'pry'
  gem 'rspec-rails'
  gem 'rubocop', '~> 0.74.0', require: false
  gem 'factory_bot_rails'
  gem 'shoulda-matchers'
  gem 'shoulda-callback-matchers'
  gem 'faker'
  gem 'simplecov'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'database_cleaner'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
