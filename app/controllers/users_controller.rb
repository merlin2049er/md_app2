# frozen_string_literal: true

class UsersController < Devise::ConfirmationsController
  include Pagy::Backend

  @site_name = 'tipping point'
  before_action :authenticate_user!

  def index
    add_breadcrumb @site_name, :root_path
    add_breadcrumb 'Users'

    @total = User.count
    @pagy, @users = pagy(User.all)
  end

  # def show
  #  @user = User.find_by_username(params[:id])
  # end
  #
end
