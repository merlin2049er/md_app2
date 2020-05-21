class Category < ActiveRecord::Base
  has_many :products

  validates_presence_of :name
  validates_presence_of :picurl

  after_initialize :set_defaults

  def set_defaults
    self.picurl ||= 'https://res.cloudinary.com/dlfodsgbd/image/upload/v1590070578/TippingPoint/photo_not_available.png'

  end
end
