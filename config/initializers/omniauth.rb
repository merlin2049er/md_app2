# Rails.application.config.middleware.use OmniAuth::Builder do
# #  provider :google_oauth2, ENV['GOOGLE_CLIENT_ID'], ENV['GOOGLE_CLIENT_SECRET'] , {redirect_uri: 'https://desolate-journey-54830.herokuapp.com/users/auth/google_oauth2/callback'}
# #   provider :google_oauth2, '389951062598-tr6te7nkrl9nogdv0pjvvl07d6dnd5l8.apps.googleusercontent.com', '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' , {redirect_uri: 'https://desolate-journey-54830.herokuapp.com/users/auth/google_oauth2/callback'}
# provider :google_oauth2, '389951062598-tr6te7nkrl9nogdv0pjvvl07d6dnd5l8.apps.googleusercontent.com', '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' , {redirect_uri: 'http://localhost:3000/users/auth/google_oauth2/callback'}
#
#
# end
# OmniAuth.config.allowed_request_methods = %i[get]
OmniAuth.config.allowed_request_methods = [:post]
