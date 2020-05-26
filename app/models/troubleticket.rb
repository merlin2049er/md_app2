class Troubleticket < ApplicationRecord
  belongs_to :user
  has_many   :ticketnotes, dependent: :destroy
  accepts_nested_attributes_for :ticketnotes

  validates_presence_of :subject
  validates_presence_of :message

end
