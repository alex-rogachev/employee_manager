source 'https://rubygems.org'

ruby '~> 2.6.6'

gem 'rails', '5.0.0'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

# Templates
gem 'slim-rails'

# Decorators
gem 'draper'

# Services
gem 'interactor'

# File storage
gem 'paperclip'
gem 'aws-sdk', '< 2.0'

# Exceptions
# gem 'airbrake'

# Assets
gem 'select2-rails'
gem 'font-awesome-rails'

# Database
gem 'pg', '~> 0.21'


# ActiveAdmin
gem 'activeadmin', '1.0.0'
gem 'active_skin'
gem 'inherited_resources'
gem 'cancan'
gem 'psych'
gem 'devise'
# Tagging
gem 'acts-as-taggable-on'

# Form objects
gem 'virtus'
gem 'simple_form'

# Tests
gem 'test-unit'

# Soft delete
gem 'paranoia'

# Text editor
gem 'ckeditor', '4.1.5'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails'
  gem 'coffee-rails'
  gem 'bootstrap-sass'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

group :production do
  gem 'rails_12factor', '0.0.2'
end

group :staging, :development, :test do
  # Mailer preview
  gem 'letter_opener'
  gem 'letter_opener_web', '~> 1.2.0', :group => :development
end
# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'
