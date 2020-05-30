# app/services/stripe/dispute_event_handler.rb
# Stripe event handler for handling webhook
module Stripe
  # This will inherite the eventHandler main class
  class DisputeEventHandler < EventHandler
    def handle_charge_dispute_created(event)
      # your code goes here
    end
  end
end
