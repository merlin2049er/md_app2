module Searchable
  extend ActiveSupport::Concern

  included do
    include Elasticsearch::Model

    mapping do
      # ...
      indexes :products, type: :object do
        indexes :body
        indexes :title
        indexes :template
        indexes :price
        indexes :draft
        indexes :active
        indexes :msrp
        indexes :startdate
        indexes :startdate
        indexes :enddate
        indexes :template
        indexes :funded
        indexes :picurl
        indexes :qty
        indexes :length
        indexes :width
        indexes :height
        indexes :weight
        indexes :courier
        indexes :courierurl
        indexes :category_id
        indexes :created_at
        indexes :updated_at
        indexes :body
      end


    end

    #def self.search(query)
      # ...
    #end
  end
end
