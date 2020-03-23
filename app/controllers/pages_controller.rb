class PagesController < ApplicationController
  def about
     add_breadcrumb 'MASSDUMP', :root_path
     add_breadcrumb 'About', :pages_about_path
  end

  def activity
  end

  def contact
     add_breadcrumb 'MASSDUMP', :root_path
     add_breadcrumb 'Contact', :pages_contact_path
  end

  def cookies
    add_breadcrumb 'MASSDUMP', :root_path
    add_breadcrumb 'Cookies', :pages_cookies_path
  end

  def dashboard
     add_breadcrumb 'MASSDUMP', :root_path
     add_breadcrumb 'Dashboard', :pages_dashboard_path
  end

  def error
    add_breadcrumb 'MASSDUMP', :root_path
    add_breadcrumb 'Error', :pages_error_path
  end

  def faq
     add_breadcrumb 'MASSDUMP', :root_path
    add_breadcrumb 'FAQ', :pages_faq_path
  end

  def index
     add_breadcrumb 'MASSDUMP', :root_path
     add_breadcrumb 'Home', :pages_index_path
  end

  def invitations
  end

  def invite
     add_breadcrumb 'MASSDUMP', :root_path
     add_breadcrumb 'Invite', :pages_invite_path
  end

  def jobs
    add_breadcrumb 'MASSDUMP', :root_path
    add_breadcrumb "Jobs", :pages_jobs_path
  end

  def privacy
    add_breadcrumb 'MASSDUMP', :root_path
    add_breadcrumb 'Privacy', :pages_privacy_path
  end

  def random
    add_breadcrumb 'MASSDUMP', :root_path
    add_breadcrumb 'Random', :pages_random_path

    @random = Product.published.limit(12).order("RANDOM()")

  end

 def terms
    add_breadcrumb 'MASSDUMP', :root_path
    add_breadcrumb 'Terms', :pages_terms_path
  end

end
