class Photo < ActiveRecord::Base
  belongs_to :product

  after_initialize :set_defaults

  validates_presence_of :uri
  # validates_presence_of :product_id
  #validates :uri, url: true


  def set_defaults
    self.enabled ||= true
    self.uri ||= 'https://res.cloudinary.com/dlfodsgbd/image/upload/v1590070578/TippingPoint/photo_not_available.png'
  end

end
