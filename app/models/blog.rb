class Blog < ApplicationRecord

  validates_presence_of :title
  validates_presence_of :description
  has_rich_text :content
end
