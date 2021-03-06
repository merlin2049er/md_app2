# frozen_string_literal: true

class Transaction < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :user_id
  validates_presence_of :invoice_number
  validates_presence_of :receipt_url
  validates_presence_of :tracking_number
  validates_presence_of :postal_carrier
  has_one :feedback

  def set_defaults
    self.shipped ||= 'false'
  end
end
