# frozen_string_literal: true

module Users
  class OmniauthCallbacksController < Devise::OmniauthCallbacksController # You need to implement the method below in your model (e.g. app/models/user.rb)
    def facebook
      @user = User.from_omniauth(request.env['omniauth.auth'])

      if @user.persisted?
        sign_in_and_redirect @user, event: :authentication # this will throw if @user is not activated
        if is_navigational_format?
          set_flash_message(:notice, :success, kind: 'Facebook')
        end
      else
        session['devise.facebook_data'] = request.env['omniauth.auth']
        redirect_to new_user_registration_url
      end
    end


    def google_oauth2
      # You need to implement the method below in your model (e.g. app/models/user.rb)
      @user = User.from_omniauth(request.env['omniauth.auth'])

      if @user.persisted?
        sign_in_and_redirect @user, event: :authentication # this will throw if @user is not activated
      if is_navigational_format?
          set_flash_message(:notice, :success, kind: 'Google')
        end
      else
        session['devise.google_data'] = request.env['omniauth.auth'].except('extra') # Removing extra as it can overflow some session stores
        redirect_to new_user_registration_url
      end
  end

    def failure
      redirect_to root_path
    end
  end
end
