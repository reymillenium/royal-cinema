Recaptcha.configure do |config|
  # Old configuration format:
  # config.public_key  = Rails.application.secrets.recaptcha_public_key
  # config.private_key = Rails.application.secrets.recaptcha_secret_key
  # config.api_version = 'v2'
  #
  # New configuration format:
  config.site_key = Figaro.env.recaptcha_site_key
  config.secret_key = Figaro.env.recaptcha_secret_key
end