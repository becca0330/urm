# for bundle instruction read also:
# http://gembundler.com/rationale.html
# and maybe:
# http://yehudakatz.com/2011/05/30/gem-versioning-and-bundler-doing-it-right/


# jf: see also: http://gembundler.com/gemfile.html
source 'http://rubygems.org'

# trouble on provider domainfactory (support max rails version 3.0.9)
# (note: Ruby 1.8.7 preinstalled)
# 2012-01-29 we use rails 3.0.x (instead 3.1.x):
# gem 'rails', '>=3.1'
# for Rails 3.1 "assets"
# gem 'coffee-rails', ">= 3.1.0"
# gem 'uglifier'
# jf: error: "...in <class:Railtie>': undefined method `debug_rjs=' for ActionView::Base:Class (NoMethodError)...."
# occures with gem 'sass-rails', 	">= 3.1.0" activated ??!!
# gem 'sass-rails', "~> 3.1.0" # "~> 3.2.0"
# gem 'railties'	, "~> 3.1.0" # "~> 3.2.0.beta"
gem 'rails', '3.0.9'
gem 'railties'

gem 'jquery-rails'

# 2012-01-29 for Javascript Execution via Ruby
gem 'execjs'
gem 'therubyracer'

# 2012-01-04 for file attachments:
gem 'paperclip'
# for ajax-file-upload:
# see: http://www.alfajango.com/blog/remotipart-rails-gem/
gem "remotipart", "~> 1.0"


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
group :dev2 do
  gem 'mysql2', '< 0.3'
end

group :development do
	# gem 'mysql2', '< 0.3' # for rails 3.0.x (version >= 0.3 works with rails 3 only)
	# gem 'mysql', "2.8.1"
	# gem 'sqlite3'
	gem "annotate", "~> 2.4.0"
end

group :production do
	# for Canberra
	# gem 'mysql2'
	# for domain factory: gem 'mysql', '2.7' !! 
	#       (version 2.8.1 does not compile on domainfactory server)
	# 2012-01-29:
	# we use locally 'mysql' with version 2.8.1 and fake the Gemfile.lock to 2.7
	# in Gemfile.lock: "mysql (2.7)" (only for development on local machine: (2.8.1))
	gem 'mysql', "2.8.1"
end

# 2012-03-22 for authentication add Authlogic
gem 'authlogic'
# 2012-05-01 for authorization unsing cancan 
gem 'cancan'
# 2012-03-22 for registration / confirmation via eMail
gem 'aasm'

