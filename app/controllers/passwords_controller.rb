# frozen_string_literal: true

# app/controllers/passwords_controller.rb
class PasswordsController < Devise::PasswordsController
  add_breadcrumb @site_name,  :root_path
  add_breadcrumb 'FORGOT'
end
