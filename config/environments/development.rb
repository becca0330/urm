URM::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb

  # In the development environment your application's code is reloaded on
  # every request.  This slows down response time but is perfect for development
  # since you don't have to restart the webserver when you make code changes.
  config.cache_classes = false

  # Log error messages when you accidentally call methods on nil.
  config.whiny_nils = true

  # Show full error reports and disable caching
  config.consider_all_requests_local       = true
  
  
  config.action_controller.perform_caching = false

  
  # Print deprecation notices to the Rails logger
  config.active_support.deprecation = :log

  # Only use best-standards-support built into browsers
  config.action_dispatch.best_standards_support = :builtin
  
  # 2012-01-29 NO assets with Rails 3.0.x
  # 2011-12-07
  # but do not use it on canberra server
  # so development ONLY (see Gemfile group)
  # require 'ruby-debug'
  
  # 2011-12-22 jf for rails 3.1
  # Do not compress assets
  # config.assets.compress = false
  
  # Expands the lines which load the assets
  # ...When debug mode is off Sprockets concatenates and runs the necessary preprocessors on all files. With debug mode turned off the manifest above would generate instead...
  # config.assets.debug = false
  # jf: error: "...in <class:Railtie>': undefined method `debug_rjs=' for ActionView::Base:Class (NoMethodError)...."
  # occures with gem 'sass-rails', 	">= 3.1.0" activated ??!!
  # deleteing public/assets does not help
  # removing ap/assets does not help
  # using other version sass 3.1.0 (instead of 3.1.0) does not help
  
  # 2011-12-22 disable because of switch to Rails 3.1
  #config.action_view.debug_rjs             = true
  
  # 2012-01-18 try to fix error: "rake assets:precompile  fails undefined method `context_class' for nil:NilClass"
  # config.assets.initialize_on_precompile = false
  
  
  # 2012-03-22 for creating urls inside the mail,
  #            when sending (registration) mail
  config.action_mailer.default_url_options = {
      :host => "127.0.0.1:3000",
  }
  
  # Don't care if the mailer can't send
  config.action_mailer.raise_delivery_errors = false
  
  
end

