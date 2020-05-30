# app/services/stripe/refund_event_handler.rb
# Stripe event handler for handling webhook
module Stripe
  # This will inherite the eventHandler main class
  class RefundEventHandler < EventHandler
    def handle_charge_refund_created(event)
      # your code goes here
    end
  end
end
