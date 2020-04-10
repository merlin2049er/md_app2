class Feedback < ApplicationRecord
  belongs_to :transactions
  validates_uniqueness_of :transaction_id
end
