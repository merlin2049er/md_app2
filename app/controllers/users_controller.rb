# frozen_string_literal: true

class UsersController < Devise::ConfirmationsController
  include Pagy::Backend

  before_action :authenticate_user!


  def index
    add_breadcrumb 'MASSDUMP',  :'root_path'
    add_breadcrumb 'Users'
  end

  # def show
  #  @user = User.find_by_username(params[:id])
  # end
  #
end
