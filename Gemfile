# jf: see also: http://gembundler.com/gemfile.html
source 'http://rubygems.org'

gem 'rails', '>=3.1'
gem 'jquery-rails'

# 2012-01-04 for file attachments:
gem 'paperclip'
# for ajax-file-upload:
# see: http://www.alfajango.com/blog/remotipart-rails-gem/
gem "remotipart", "~> 1.0"

# 2011-12-22
# for Rails 3.1 "assets"
gem 'coffee-rails', ">= 3.1.0"
gem 'uglifier'
# jf: error: "...in <class:Railtie>': undefined method `debug_rjs=' for ActionView::Base:Class (NoMethodError)...."
# occures with gem 'sass-rails', 	">= 3.1.0" activated ??!!
gem 'sass-rails', "~> 3.1.0" # "~> 3.2.0"
gem 'railties'	, "~> 3.1.0" # "~> 3.2.0.beta"

# Deploy with Capistrano (no capistrano used at server)
# gem 'capistrano'

# To use debugger (ruby-debug for Ruby 1.8.7+, ruby-debug19 for Ruby 1.9.2+)
# gem 'ruby-debug'
# gem 'ruby-debug19', :require => 'ruby-debug'


# Bundle gems for the local environment. Make sure to
# put test-only gems in this group so their generators
# and rake tasks are available in development mode:
# group :development, :test do
#   gem 'webrat'
# end

# jf 2011-12-07
# why does this produce an error on canberra ??
#group :development do
#	gem 'ruby-debug19'
#end

group :development do
	gem 'sqlite3'
end
group :production do
	# for Canberra
	# gem 'mysql2'
	# for domain factory:
	gem 'mysql'
end