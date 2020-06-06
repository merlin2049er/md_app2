class PagesController < ApplicationController
  include Pagy::Backend

  def about
     add_breadcrumb @site_name, :root_path
     add_breadcrumb 'About'
  end

#  def banned
#    add_breadcrumb @site_name, :root_path
#    add_breadcrumb 'Banned'
#  end

  def cookies
    add_breadcrumb @site_name, :root_path
    add_breadcrumb 'Cookies'
  end

  def contact

    add_breadcrumb @site_name, :root_path
    add_breadcrumb 'Contact'

    @contact = Contact.new
  end

  def dashboard
     add_breadcrumb @site_name, :root_path
     add_breadcrumb 'Dashboard'

      # user model queries
      @superuser = User.where('admin' => true)

      @toptenlogin = User.limit(10).order('sign_in_count DESC')

      @lasttenlogin = User.limit(10).order('last_sign_in_at DESC')

      # products model queries

      @toptenending = Product.limit(10).order('enddate DESC')
      @toptenproductsstarted = Product.limit(10).order('startdate ASC')

      @toptenpricy = Product.limit(10).order('Price DESC')
      @toptencheap = Product.limit(10).order('Price ASC')

      @cartcount = Cart.count
      @draftcount = Product.where('draft' => true).count

      @successfully = Product.where('funded' => true).count
      @unsuccessfully = Product.where('funded' => false).count

      @unconfirmeduser = User.where('confirmed_at =?', nil).count
      @registeredusers = User.count

      @totalnotifications = Notification.count
      @totaltransactions = Transaction.count

  end

  def error
    add_breadcrumb @site_name, :root_path
    add_breadcrumb 'Error'
  end

#  def faq
#     add_breadcrumb @site_name, :root_path
#    add_breadcrumb 'FAQ'
#  end

  def index
     add_breadcrumb @site_name, :root_path
     add_breadcrumb 'Home'

     # check for filled in profile
     if current_user and !current_user.is_profile_complete and Blacklist.find_by_email(current_user.email).nil?
         flash[:warning] = 'Please, fill in your profile...'
     end
     #

    @recent_products = Product.published.most_recent(6)
    @last_chance = Product.published.ending_soonest(6)

  end

  def invitations
  end

  def invite
     add_breadcrumb @site_name, :root_path
     add_breadcrumb 'Invite'

     @invite = Invite.new
     @message = 'Hi, please check out this awesome site and get in on the savings.'
  end

  def jobs
    add_breadcrumb @site_name, :root_path
    add_breadcrumb "Jobs"
  end

  def payments
    add_breadcrumb @site_name, :root_path
    add_breadcrumb 'Payments'
  end

  def privacy
    add_breadcrumb @site_name, :root_path
    add_breadcrumb 'Privacy'
  end

  def random
    add_breadcrumb @site_name, :root_path
    add_breadcrumb 'Random'

    @random = Product.published.limit(12).order("RANDOM()")

  end

 def terms
    add_breadcrumb @site_name, :root_path
    add_breadcrumb 'Terms'
  end

  def shipping
     add_breadcrumb @site_name, :root_path
     add_breadcrumb 'Shipping'
   end

   def returns
      add_breadcrumb @site_name, :root_path
      add_breadcrumb 'Returns'
    end

    def taxes
       add_breadcrumb @site_name, :root_path
       add_breadcrumb 'Taxes'
     end

end
