source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.1.7'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.12'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'bootstrap-generators', '~> 3.3.4'
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'jquery-validation-rails'
gem 'devise', '~> 4.7'
gem 'devise_invitable', '~> 2.0.0'
gem 'devise-bootstrap-views', '~>0.0.11'
gem 'carrierwave', '~> 2.0'
gem 'carrierwave-audio'
gem 'carrierwave-video'
# gem 'carrierwave-ffmpeg'
# gem 'carrierwave_backgrounder'
gem 'mini_magick', ">= 4.9.4"
# gem 'mime-types'
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'administrate'
gem 'momentjs-rails', '>= 2.9.0'
gem 'bootstrap3-datetimepicker-rails', '~> 4.17.47'
gem 'kaminari'
gem 'wicked'
gem 'record_tag_helper', '~> 1.0'
gem 'cocoon'
gem "gretel"
gem "figaro"
gem "fog-aws"
gem "figaro"
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'

group :development, :test do
  gem 'rspec-rails', '~> 3.6.0'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'letter_opener'
  gem 'spring-commands-rspec'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'bullet'
end




