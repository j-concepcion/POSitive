ActionMailer::Base.smtp_settings = {
  address:        Base::Settings.mailer.address,
  port:           Base::Settings.mailer.port,
  user_name:      Base::Settings.mailer.user_name,
  password:       Base::Settings.mailer.password,
  authentication: :plain,
  enable_starttls_auto: true
}

ActionMailer::Base.asset_host = Base::Settings.mailer.asset_host

ActionMailer::Base.delivery_method = Base::Settings.mailer.delivery_method

ActionMailer::Base.default_url_options[:host] = Base::Settings.mailer.default_url_options.host
ActionMailer::Base.default_url_options[:port] = Base::Settings.mailer.default_url_options.port