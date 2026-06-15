source "https://rubygems.org"

gem 'rails', '~> 8.1', '>= 8.1.3'
gem "sprockets-rails"
gem "pg", "~> 1.1"
gem "puma", ">= 5.0"
gem "importmap-rails"
gem "tzinfo-data", platforms: %i[ windows jruby ]

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

gem "sassc-rails", "~> 2.1"
gem "bootstrap", "~> 5.0"
gem "devise", "~> 4.9"
gem "aasm", "~> 5.5"
gem "phonelib", "~> 0.10.1"
gem "textris", "~> 0.7.0"
gem 'rails-i18n', '~> 8.1'
gem "devise-i18n", "~> 1.12"
gem "twilio-ruby", "~> 7.3"

# Ruby 4.0 a sorti ces libs stdlib en bundled gems : les déclarer explicitement
gem "ostruct"
gem "csv"
gem "benchmark"

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[ mri windows ], require: "debug/prelude"

  # Static analysis for security vulnerabilities [https://brakemanscanner.org/]
  gem "brakeman", require: false

  # Omakase Ruby styling [https://github.com/rails/rubocop-rails-omakase/]
  gem "rubocop-rails-omakase", require: false
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem "web-console"
end
