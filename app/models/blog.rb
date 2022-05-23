class Blog < ApplicationRecord

  # for validation only
  attr_accessor :content

  validates_presence_of :title
  validates_presence_of :description
  has_rich_text :content

  has_many :blog_comments
  belongs_to :user

  validate :post_content_present

  def post_content_present
    errors.add(:base, "Content can't be empty") if content.blank?
  end

end
