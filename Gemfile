source 'https://rubygems.org'
ruby '2.2.2'

gem 'rails', '4.2.3'

# Web server
gem 'puma', group: [:development, :production]

# Databases
gem 'sqlite3', group: :development
group :production do
  gem 'pg'
  gem 'rails_12factor'
end

# Markup and styling
gem 'haml'
gem 'erb2haml'
gem 'sass-rails', '~> 5.0'
gem 'bootstrap-sass'

# Authentication and Security
gem 'devise'
gem 'figaro', '1.0'

# Javascript related gems
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'jquery-rails'
gem 'jbuilder', '~> 2.0'
gem 'chartkick'

# Testing
group :test, :development do
  gem 'rspec-rails', '~>3.0'
  gem 'shoulda-matchers'
  gem 'capybara'
  gem 'factory_girl_rails', '~>4.0'
end

# Miscellaneous
gem 'turbolinks'
gem 'sdoc', '~> 0.4.0', group: :doc
gem 'faker'
gem 'rack-cors', :require => 'rack/cors'
gem 'groupdate'

group :development, :test do
  gem 'byebug'
  gem 'web-console', '~> 2.0'
  gem 'spring'
end
