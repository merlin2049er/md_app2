class CheckoutController < ApplicationController

    def create
      #? maybe find cart instead?
      #product = Product.find(params[:id])

      cart = Cart.find(params[:id])

      #cart = Cart.where('id =?', params[:id])

    #  binding.pry


      if cart.nil?
          redirect_to root_path
        return
      end

      product = Product.find(cart.product_id)

      cart_total = (product.price * 100).floor
      user = User.find(cart.user_id)

      tax = Tax.find_by_prov_id(user.state)

      if !tax.nil?
        cart_total = cart_total +(cart_total * tax.tax_rate).floor
      end
    # cart_image = asset_pack_path + "media/images/#{product.picurl }"

  # setup a stripe payment for session
  #fix product amount and add qty
  @session = Stripe::Checkout::Session.create({

      client_reference_id: cart.id,
  #    customer: null,
      customer_email: user.email,
      billing_address_collection: 'required',
      payment_method_types: ['card'],
      line_items: [{
        name: product.title,
  #     description:  product.template,
       images: [ product.picurl],
        amount: cart_total,
        currency: 'cad',
        quantity: cart.qty,

        }],
  # avoid using sessions like this... use webhooks instead?
        success_url: checkout_success_url + '?session_id={CHECKOUT_SESSION_ID}',
        cancel_url: checkout_cancel_url,

        })


      respond_to do |format|
        format.js #  render create.js.erb
      end

    end

    def cancel

      add_breadcrumb @site_name, :root_path
      add_breadcrumb 'Payment status'

      render "cancel"

    end

    def success

      add_breadcrumb @site_name, :root_path
      add_breadcrumb 'Payment status'

    # not sure if it returns a session id
    #  if params[:session_id].nil?
    #    redirect_to root_path
    #    return
    #  end

      @success = Stripe::Checkout::Session.retrieve(params[:session_id])
      @payment_intent = Stripe::PaymentIntent.retrieve(@session_payment_intent)


      render "success"


    end


end
