class ConfirmationsController < Devise::ConfirmationsController

add_breadcrumb @site_name, :root_path
add_breadcrumb 'CONFIRMATION'

private

def after_confirmation_path_for(_pages, _index)
  new_user_session_path
end

end
