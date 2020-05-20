class Troubleticket < ApplicationRecord
  belongs_to :user
  after_initialize :set_defaults

 #validates_presence_of :user_id
 
  validates_presence_of :subject
  validates_presence_of :message


 def set_defaults
  # self.user_id ||= ?
   # self.status ||= true
end

end
