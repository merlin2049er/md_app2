# frozen_string_literal: true

namespace :db do
  desc 'add friendly slugs to products'
    task add_friendly_slugs_to_products: :environment do
    
   Product.find_each(&:save)


  end
end
