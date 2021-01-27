class Announcement < ApplicationRecord

    validates_presence_of :announcement

  scope :top_annoucement
    lambda {
      where(enabled: true).order('startdate desc').limit(1)
    }

end
