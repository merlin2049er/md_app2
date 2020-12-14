# frozen_string_literal: true

class CheckoutController < ApplicationController # product = Product.find(params[:id])
  def create
    cart = Cart.find(params[:id])

    # cart = Cart.where('id =?', params[:id])

    #  binding.pry

    if cart.nil?
      redirect_to root_path
      return
    end

    product = Product.find(cart.product_id)

    cart_total = (product.price * 100).floor
    user = User.find(cart.user_id)

    tax = Tax.find_by_prov_id(user.state)

    cart_total += (cart_total * tax.tax_rate).floor unless tax.nil? # cart_image = asset_pack_path + "media/images/#{product.picurl }"

    # setup a stripe payment for session
    # fix product amount and add qty
    @session =
      Stripe::Checkout::Session.create(
        {
          client_reference_id: cart.id,
          #    customer: null,
          customer_email: user.email,
          billing_address_collection: 'required',
          payment_method_types: %w[card],
          line_items: [
            {
              name: product.title,
              images: [
                #     description:  product.template,
                product.picurl
              ],
              amount: cart_total,
              currency: 'cad',
              quantity: cart.qty
            }
          ],
          # avoid using sessions like this... use webhooks instead?
          success_url:
            "#{checkout_success_url}?session_id={CHECKOUT_SESSION_ID}",
          cancel_url: checkout_cancel_url
        }
      )

    respond_to(&:js)
  end

  def cancel
    #add_breadcrumb @site_name, :root_path
    add_breadcrumb 'Payment status'

    render 'cancel'
  end

  def success
    #add_breadcrumb @site_name, :root_path
    add_breadcrumb 'Payment status'

    # not sure if it returns a session id
    #  if params[:session_id].nil?
    #    redirect_to root_path
    #    return
    #  end

    @success =
      Stripe::Checkout::Session.retrieve(
        { id: params[:session_id], expand: %w[payment_intent] }
      ) # ch = Stripe::Checkout::Session.retrieve({id:  CHECKOUT_SESSION_ID,   expand: ['payment_intent'],},)

    render 'success'

    # CART_ID = @success.payment_intent.client_reference_id
    # FIND CART BY CART_ID
    cart = Cart.find(@success.client_reference_id) # cart.paid = true ?
    cart.update(paid: true)
    cart.save

    # CREAtE A NEW TRANSACTION FOR User

    transaction =
      Transaction.new do |t|
        t.user_id = cart.user_id
        t.postal_carrier = 'Canada Post'
        t.invoice_number = '...invoice here...' # t.invoice_number = @success.payment_intent.charges.data[0].invoice
        t.receipt_url = @success.payment_intent.charges.data[0].receipt_url
        t.tracking_number = '...coming soon...'
        t.transaction_msg = '...shipment pending...'
      end
    transaction.save # ADD REICEpT URL # MARK AS PAID  (TOGGLE BOOLEAN VALUE) #  cart.user_id
  end
end
