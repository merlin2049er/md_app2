class Ticketnote < ApplicationRecord
  belongs_to :troubleticket
  validates_presence_of :troubleticket_id
  validates_presence_of :notes

end
