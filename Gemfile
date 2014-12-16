source 'https://rubygems.org'
ruby '2.1.5'
gem 'rails', 												'~> 4.1.8'
gem 'sprockets-rails',							'~> 2.2.0'
#Forgive me TODO
gem 'protected_attributes',			'1.0.8'
# Use SCSS for stylesheets
gem 'sass-rails', 									'~> 4.0.3'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', 										'>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', 								'~> 4.0.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
gem 'therubyracer',									'0.12.1',						platforms: :ruby
# Use jquery as the JavaScript library
gem 'jquery-rails',									'3.1.2'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks',										'2.5.2'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', 										'~> 2.2.5'
gem 'gravatar_image_tag', 					'1.0.0.pre2'
gem 'will_paginate',								'3.0.7'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', 												'~> 0.4.0',          group: :doc
# Use ActiveModel has_secure_password
gem 'bcrypt', 											'~> 3.1.7'
# gem 'activeadmin', github: 'activeadmin'
gem 'twilio-ruby',									'~> 3.14.0'
gem 'rufus-scheduler',							'3.0.9'
gem 'nokogiri',											'~> 1.6.4.1'
gem 'shopify_api',									'3.2.1'
gem 'simplecov', :require => false, :group => :test
gem 'faker', 												'~> 0.3.1'
gem 'zeroclipboard-rails',					'0.1.0'
gem 'highline',											'1.6.21'
gem 'building',											'1.1.2'
gem 'pg',														'0.17.1'
gem "jquery-ui-rails",							'5.0.2'
gem 'json',													'1.7.7'
# gem 'chef',													'11.16.4'
gem 'knife-solo',										'0.4.2'
gem 'librarian-chef', 							'0.0.4'
gem 'daemons',											'1.1.9'
gem 'delayed_job_active_record',		'4.0.2'
gem 'delayed_job_web',							'1.2.9'

group :development do
	gem 'annotate', 									'2.6.5'
	gem 'bullet',											'4.14.0'
	gem 'rack-mini-profiler'
end

group :production do
	gem 'newrelic_rpm', 							'3.9.7.266'
	# Use the pg gem for Heroku in prod only
	gem 'rails_12factor',							'0.0.3'
	# Use unicorn as the app server
	gem 'unicorn',										'~> 4.8.3'
	gem 'unicorn-worker-killer'
	# gem 'remote_syslog_logger'
end 

group :test do
	gem 'factory_girl_rails', ' 1.0'
end

group :test, :development do
	# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
	gem 'spring',							'1.1.3'
	gem 'rspec-nc',						'~> 0.2.0'
	gem 'rspec-rails',				'~> 3.1.0'
	gem 'rspec-autotest',			'1.0.0'
	gem 'rspec-its',					'1.1.0'
	gem 'autotest-rails',			'4.2.1'
	gem 'autotest-fsevent',		'0.2.10'
	gem 'spork-rails',				'4.0.0'
	gem 'webrat', 						'~> 0.7.1'
	gem 'byebug',							'~> 3.5.1'
	gem 'capybara', 					'~> 2.3.0'
	# gem 'selenium-webdriver', '2.0'
	# Use sqlite3 as the database for Active Record in DEV or TEST only
	gem 'database_cleaner',		'1.3.0'
	gem 'launchy',						'2.4.3'
	gem 'poltergeist',				'1.5.1'
end