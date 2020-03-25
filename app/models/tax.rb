class Tax < ApplicationRecord

  validates_presence_of :prov_id
  validates_presence_of :tax_rate

end
