source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.7.1"

gem "bcrypt", "~> 3.1.7"
gem "bootsnap", ">= 1.4.2", require: false
gem "rails", "~> 6.0.3", ">= 6.0.3.2"
gem "impressionist"
gem "puma", "~> 4.3.3"
gem "sass-rails", ">= 6"
gem "turbolinks", "~> 5"
gem "jbuilder", "~> 2.7"
gem "draper"

# Use Active Storage variant
gem "image_processing", "~> 1.2"
# gem "lightgallery-rails"
gem "jquery-rails"
gem "devise"
gem "rolify"
gem "pg"
gem "webpacker"
gem "font-awesome-rails"
gem "globalize"
gem "ckeditor", github: "galetahub/ckeditor"
gem "carrierwave-postgresql"
gem "mini_magick"
gem "rmagick", "~> 4.1"
gem "acts_as_list"
gem "ancestry"
gem "i18n-js"
gem "i18n-active_record", "~> 0.4.0" # git: "https://github.com/svenfuchs/i18n-active_record.git", require: "i18n/active_record"
gem "client_side_validations"
gem "carrierwave-video"
gem "carrierwave-video-thumbnailer"
gem "carrierwave-ffmpeg"
gem "carrierwave-ffmpeg-encoder", :git => "https://github.com/azelenets/carrierwave-ffmpeg-encoder.git"
gem "streamio-ffmpeg"
gem "mime-types"
gem "render_anywhere"
gem "wkhtmltopdf-binary"
gem "jquery_file_download-rails"
gem "videojs-ng"
gem "cookies_eu"
gem "htmlentities"
gem "wicked_pdf"
gem "friendly_id"
gem "taglib-ruby"
gem "react-rails"
gem "fullcalendar-rails"
gem "momentjs-rails"

group :development, :test do
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
  gem "pry"
  gem "pry-byebug"
  gem "pry-rails"
  gem "solargraph"
  gem "rubocop"
end

group :development do
  gem "web-console", ">= 3.3.0"
  gem "listen", "~> 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end

group :test do
  gem "capistrano", "~> 3.10", require: false
  gem "capistrano-rails", "~> 1.4", require: false
  gem "capistrano-rvm", require: false
  gem "capistrano-bundler", require: false
  gem "capistrano-passenger", require: false
  gem "capybara", ">= 2.15"
  gem "selenium-webdriver"
  gem "webdrivers"
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]