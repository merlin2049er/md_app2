# frozen_string_literal: true

class Watchlist < ActiveRecord::Base
  belongs_to  :user
  has_many    :products
  validates_uniqueness_of :product_id

  validates_presence_of :user_id
  validate :validate_product_id

def validate_product_id
    pr = Product.find_by_id(self.product_id)
    if pr.nil?
      errors.add(:product, 'Invalid Product id')
    end
end

end
