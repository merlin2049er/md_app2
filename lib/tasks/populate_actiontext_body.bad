# frozen_string_literal: true

namespace :db do
  desc 'Fill database actiontext body'
  task populate_actiontext_body: :environment do
    require 'populator'

   # [Category ].each(&:delete_all)

    ActionTextRichText.populate 250 do | t |

    t.body = Populator.sentences(2..10)
    t.name = "body"
    t.record_type = "Product"
    t.record_id = 1..250

    end

  end
end
