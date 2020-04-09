# frozen_string_literal: true

# app/controllers/passwords_controller.rb
class SessionsController < Devise::SessionsController
  @site_name = 'tipping point'


     add_breadcrumb @site_name, :root_path
     add_breadcrumb 'LOG IN'

  auto_session_timeout_actions

  def active
    render_session_status
  end

  def timeout
    render_session_timeout
  end

end
