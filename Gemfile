# >= x.x.x  x.x.x以上のバージョンが必要
# >= x.x.x, < y.y.y x.x.x以上、y.y.y以下のバージョンが必要
# ~> 1.0.0 1.0.0以上で利用可能で、1.0.9などは問題なく、1.1にバージョンが上がると利用不可になります。

source 'https://rubygems.org'
ruby '2.5.1'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.6'
# Use mysql as the database for Active Record
gem 'mysql2', '>= 0.3.18', '< 0.6.0'
# Use Puma as the app server
gem 'puma', '~> 3.7'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
# gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder

gem 'foundation-rails', '6.4.3.0'
gem 'autoprefixer-rails', '8.5.0'
gem "font-awesome-rails", '>= 4.7.0.4'

gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development
gem 'jquery-rails'

gem 'devise', '4.4.3'
gem 'devise-i18n', '1.6.2'
gem 'mail_form', '1.7.1'

# Display SVG images on view templates
gem 'inline_svg', '1.3.1'

gem 'dotenv-rails'

gem 'google-cloud-translate'

gem 'ancestry', '3.0.2'

gem 'meta-tags', '2.10.0'

gem 'canonical-rails'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
  gem 'guard', require: false
  gem 'guard-minitest', require: false
  gem 'pry'
  gem 'faker'
end

group :test do
  gem 'rails-controller-testing'
  gem 'webmock', '3.4.1'
  gem 'vcr', '4.0.0'
  gem 'mocha', '1.5.0'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'

  gem 'guard-livereload', '~> 2.5', require: false
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
