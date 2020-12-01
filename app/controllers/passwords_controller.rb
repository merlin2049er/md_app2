# frozen_string_literal: true

# app/controllers/passwords_controller.rb
class PasswordsController < Devise::PasswordsController
  @site_name = 'tipping point'

  add_breadcrumb @site_name, :root_path
  add_breadcrumb 'FORGOT'
end
