URM::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb


  # The production environment is meant for finished, "live" apps.
  # Code is not reloaded between requests
  #
  config.cache_classes = false

  # Full error reports are disabled and caching is turned on
  config.consider_all_requests_local       =  false
  config.action_controller.perform_caching = true

  # Specifies the header that your server uses for sending files
  config.action_dispatch.x_sendfile_header = "X-Sendfile"

  # For nginx:
  # config.action_dispatch.x_sendfile_header = 'X-Accel-Redirect'

  # If you have no front-end server that supports something like X-Sendfile,
  # just comment this out and Rails will serve the files

  # See everything in the log (default is :info)
  # config.log_level = :debug
  config.log_level = :debug

  # Use a different logger for distributed setups
  # config.logger = SyslogLogger.new

  # Use a different cache store in production
  # config.cache_store = :mem_cache_store

  # Disable Rails's static asset server
  # In production, Apache or nginx will already do this
  config.serve_static_assets = true

  # Enable serving of images, stylesheets, and javascripts from an asset server
  # config.action_controller.asset_host = "http://assets.example.com"

  # Disable delivery errors, bad email addresses will be ignored
  # config.action_mailer.raise_delivery_errors = false

  # Enable threaded mode
  # config.threadsafe!

  # Enable locale fallbacks for I18n (makes lookups for any locale fall back to
  # the I18n.default_locale when a translation can not be found)
  config.i18n.fallbacks = true

  # Send deprecation notices to registered listeners
  config.active_support.deprecation = :notify
  
# 2012-01-29 switch to Rails 3.0.9 (only this is possible at domainfactory)
  # 2011-12-22 switch to Rails3.1
  # Compress both stylesheets and JavaScripts
# config.assets.compress = false
  # Don't fallback to assets pipeline if a precompiled asset is missed
  # jf: try to fix error: add.png isn't precompiled
#  config.assets.compile = true
  # Generate digests for assets URLs
#  config.assets.digest = false
  # Defaults to Rails.root.join("public/assets")
  # config.assets.manifest = YOUR_PATH
#  config.assets.js_compressor  = :uglifier
#  config.assets.css_compressor = :scss
  
  # 2012-01-18 try to fix error: "rake assets:precompile  fails undefined method `context_class' for nil:NilClass"
  # did not help: :(
#  config.assets.initialize_on_precompile = false
  
  
  
  # 2012-03-22 for creating urls inside the mail,
  #            when sending (registration) mail
  config.action_mailer.default_url_options = {
      :host => "urm.feiner.at"
  }
  # 2012-03-23 jf send mails
  config.action_mailer.sendmail_settings = {
     :location => '/bin/sendmail',
     :arguments => '-t'
  }
  config.action_mailer.perform_deliveries = true
  config.action_mailer.raise_delivery_errors = true
  
end
