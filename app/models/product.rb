require 'elasticsearch'
require 'elasticsearch/model'

class Product < ActiveRecord::Base
  # include PublicActivity::Model
  # tracked owner: Proc.new{ |controller, model| controller.current_user }
#  include Elasticsearch::Model
#  include Elasticsearch::Model::Callbacks


  is_impressionable
  has_rich_text :body

  include Searchable

  acts_as_commontable dependent: :destroy

  after_initialize :set_defaults

after_touch() { __elasticsearch__.index_document }
  # has_and_belongs_to_many :users
  # add cart here...
  belongs_to :cart, optional: true
  belongs_to :category
  has_many :photos
  accepts_nested_attributes_for :photos, reject_if: :all_blank, allow_destroy: true

  validates_presence_of :title
  validates_presence_of :category_id
  validates_presence_of :picurl
  validates :picurl, url: true

  # validates_presence_of :template

  validates_presence_of :body
  validates_presence_of :qty
  validates_presence_of :price

  validates_presence_of :msrp
  validates_presence_of :startdate
  validates_presence_of :enddate
  # validates_presence_of :length
  # validates_presence_of :width
  # validates_presence_of :height
  # validates_presence_of :weight
  validates_presence_of :courier
  validates_presence_of :courierurl

  validates_length_of :title, maximum: 35

  validates_date :startdate, before: :enddate,
  before_message: 'must be at before the end date.'

  validates_numericality_of :price, :greater_than => 0
  validates_numericality_of :qty, :greater_than => 0
  #validates_numericality_of :msrp, :greater_than => :price


  # hopefully this works
  #  validates_numericality_of :qty, less_than_or_equal_to: 10, greater_than: 0

  def commentable_title
     "Undefined Post Title"
   end

   def commentable_url
     "#"
   end

   def commentable_state
     "published"
   end



  def set_defaults
    self.msrp ||= 0.0
    self.price ||= 0.0
    self.picurl ||= 'https://res.cloudinary.com/dlfodsgbd/image/upload/v1590070578/TippingPoint/photo_not_available.png'
    self.qty ||= 1

    self.funded ||= 'false'
    self.courier ||= 'Canada Post'
    self.courierurl ||= 'https://www.canadapost.ca'
  end




  # default_scope { where(draft: false, active: true, funded: false ) }
  # default_scope { where(draft: false, active: true  ) }
  # default_scope { where( 'enddate > ?', DateTime.now ) }

  scope :published, -> {
    where(draft: false)
    .where(active: true)
    .where(funded: false)
    .where('? BETWEEN startdate AND enddate', Date.today)
    #.where('startdate >= ?', DateTime.now.to_s )
    #.where('enddate <= ?' , DateTime.now.to_s )
    #.where(':date BETWEEN startdate OR enddate', date: DateTime.now.to_s)
  }

  # scope :incart , -> { where(draft: false, active: true ) }

  scope :most_recent, ->(limit) { order('created_at desc').limit(limit) }
  scope :ending_soonest, ->(limit) { order('enddate desc').limit(limit) }


  def self.search(query)

    if !query.blank?
     product =  __elasticsearch__.search(
      {
        query: {
          multi_match: {
            query: query,
            fields: ['title', "body.body"]
          }
        },
        highlight: {
          pre_tags: ['<em class="label label-highlight">'],
          post_tags: ['</em>'],
          fields: {"title": {},"body.body":{}}

        }
      }
      )
    else
      product = Product.published
    end
    return product
  end

end
