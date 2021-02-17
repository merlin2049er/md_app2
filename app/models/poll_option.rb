class PollOption < ApplicationRecord
  belongs_to :poll
  validates_presence_of :poll
  validates_presence_of :poll_url

end
