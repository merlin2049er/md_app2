class PagesController < ApplicationController
  def about
     add_breadcrumb 'MASSDUMP', :root_path
     add_breadcrumb 'about', :about_path   
  end

  def activity
  end

  def contact
     add_breadcrumb 'MASSDUMP', :root_path
     add_breadcrumb 'contact', :pages_contact_path
  end

  def cookies
    add_breadcrumb 'MASSDUMP', :root_path
    add_breadcrumb 'cookies', :cookies_path
  end

  def dashboard
     add_breadcrumb 'MASSDUMP', :root_path
     add_breadcrumb 'dashboard', :dashboard_path
  end

  def error
    add_breadcrumb 'MASSDUMP', :root_path
    add_breadcrumb 'error', :error_path
  end

  def faq
     add_breadcrumb 'MASSDUMP', :root_path
    add_breadcrumb 'faq', :faq_path
  end

  def index
     add_breadcrumb 'MASSDUMP', :root_path
     add_breadcrumb 'home', :index_path
  end

  def invitations
  end

  def invite
     add_breadcrumb 'MASSDUMP', :root_path
     add_breadcrumb 'invite', :pages_invite_path
  end

  def jobs
    add_breadcrumb 'MASSDUMP', :root_path
    add_breadcrumb "jobs", :jobs_path
  end

  def privacy
    add_breadcrumb 'MASSDUMP', :root_path
    add_breadcrumb 'privacy', :privacy_path
  end
  
  def random
    add_breadcrumb 'MASSDUMP', :root_path
    add_breadcrumb 'random', :random_path

    @random = Product.published.limit(12).order("RANDOM()")

  end

 def terms
    add_breadcrumb 'MASSDUMP', :root_path
    add_breadcrumb 'terms', :terms_path
  end
  
end
