Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV['GOOGLE_CLIENT_ID'], ENV['GOOGLE_CLIENT_SECRET'] #, {redirect_uri: 'facebook.com'}
puts ENV['GOOGLE_CLIENT_ID'].inspect

end
# OmniAuth.config.allowed_request_methods = %i[get]
OmniAuth.config.allowed_request_methods = [:post]
