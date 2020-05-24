class Ticketnote < ApplicationRecord
  belongs_to :troubleticket
  validates_presence_of :notes
  
end
