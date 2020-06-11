class SuccessfulCampaignMailer < ApplicationMailer
  default from: 'no-reply@jginfosys.com'

   def successful_campaign_email(email,firstname)
     #@user = params[:user]
     @user.email = email
     @user.firstname = firstname

     @url  = 'https://desolate-journey-54830.herokuapp.com/'
    # mail(to: @user.email, subject: 'The campaign was a success...')
    mail(to: @email , subject: 'The campaign was a success...')
   end

end
