class ApplicationController < ActionController::Base

def all_categories
  @categories = Category.all
  @categories = Category.order(:name)
end

end
