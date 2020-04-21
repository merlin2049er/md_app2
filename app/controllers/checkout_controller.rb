class CheckoutController < ApplicationController

    def create
      #? maybe find cart instead?
      #product = Product.find(params[:id])
      cart = Cart.find(params[:id])
      product = cart.product_id
      product = Product.find(cart.id)
      cart_total = (product.price * 100).floor
      user = User.find(cart.user_id)

      tax = Tax.find_by_prov_id(user.state)
      cart_total = cart_total +(cart_total * tax.tax_rate).floor


# binding.pry


      if cart.nil?
      #if product.nil?
        redirect_to root_path
        return
      end

  # binding.pry

  # setup a stripe payment for session
  #fix product amount and add qty
    @session = Stripe::Checkout::Session.create(
      billing_address_collection: 'required',
      payment_method_types: ['card'],
      line_items: [{
        name: product.title,
  #      description:  product.template,
        images: ['https://desolate-journey-54830.herokuapp.com/packs/media/images/' + product.picurl],
  #      amount: (product.price * cart.qty * 100).floor,
        amount: cart_total,
        currency: 'cad',
        quantity: cart.qty
        }],
  # avoid using sessions like this... use webhooks instead
        success_url: checkout_success_url + '?session_id ={CHECKOUT_SESSION_ID}',
   #     success_url: checkout_success_url,
        cancel_url: checkout_cancel_url

    )


      respond_to do |format|
        format.js # render create.js.erb
      end

    end

    def cancel

      add_breadcrumb @site_name, :root_path
      add_breadcrumb 'Payment status'

      render "cancel"

    end

    def success


     # not sure if it returns a session id
      if params[:session_id].nil?
        redirect_to root_path
        return
      end

      @success = Stripe::Checkout::Session.retrieve(params[:session_id])
      @payment_intent = Stripe:payment_intent.retrieve(@session_payment_intent)

    end


end
