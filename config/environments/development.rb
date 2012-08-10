Apphera::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb

  # In the development environment your application's code is reloaded on
  # every request.  This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  config.i18n.default_locale = :de

  
  config.action_mailer.delivery_method = :ses
  # Log error messages when you accidentally call methods on nil.
  config.whiny_nils = true

  # Show full error reports and disable caching
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # config.action_mailer.default_url_options = { host: 'apphera.com'}
  #  config.action_mailer.raise_delivery_errors = true
  #  config.action_mailer.smtp_settings = {
  #  address: "email-smtp.us-east-1.amazonaws.com",
  #  port: 465,
  #  domain: "xxx",
  #  authentication: :login,
  #  user_name: "xxxxx",
  #  password: "xxx"
  #  }

  config.action_mailer.default_url_options = { host: 'apphera.com'}

  
  
  # config.action_mailer.default_url_options = { :host => 'apphera.com' }
  #  config.action_mailer.delivery_method = :smtp
  #  config.action_mailer.raise_delivery_errors = true



  


  # Print deprecation notices to the Rails logger
  config.active_support.deprecation = :log

  # Only use best-standards-support built into browsers
  config.action_dispatch.best_standards_support = :builtin

  # Do not compress assets
  config.assets.compress = false

  # Expands the lines which load the assets
  config.assets.debug = false


  config.after_initialize do
    Bullet.enable = true
    Bullet.alert = true
    Bullet.bullet_logger = true
    Bullet.console = true
    Bullet.growl = false

    Bullet.rails_logger = true
    Bullet.disable_browser_cache = true
  end



end
Tire.configure do
   url "127.0.0.1:9200"
 end
