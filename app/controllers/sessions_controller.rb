# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]



  auto_session_timeout_actions

def active
  render_session_status
end

def timeout
  render_session_timeout
end

end
