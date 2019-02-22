source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.5.1"

gem "rails", "~> 5.2.1", ">= 5.2.1.1"
gem "sqlite3", "~> 1.3.6"
gem "puma", "~> 3.11"
gem "sass-rails", "~> 5.0"
gem "uglifier", ">= 1.3.0"
gem "bootstrap-sass", "3.3.7"
gem "jquery-turbolinks"
gem "jquery"
gem "jquery-rails"
gem "bcrypt", "3.1.11"
gem "faker",  "1.7.3"
gem "carrierwave", "1.1.0"
gem "kaminari"
gem "bootstrap-kaminari-views"
gem "mini_magick", "4.7.0"
gem "fog", "1.40.0"
gem "config"
gem "rubocop", "~> 0.46.0", require: false


gem "coffee-rails", "~> 4.2"
gem "turbolinks", "~> 5"
gem "jbuilder", "~> 2.5"

gem "bootsnap", ">= 1.1.0", require: false

group :development, :test do
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem "web-console", ">= 3.3.0"
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end

group :production do
  gem "pg"
end

group :test do
  gem "capybara", ">= 2.15"
  gem "selenium-webdriver"
  gem "chromedriver-helper"
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
