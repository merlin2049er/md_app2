class Troubleticket < ApplicationRecord
  belongs_to :user
  has_many   :ticketnotes, dependent: :destroy

  validates_presence_of :subject
  validates_presence_of :message

end
