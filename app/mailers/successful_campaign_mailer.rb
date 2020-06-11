class SuccessfulCampaignMailer < ApplicationMailer
  default from: 'no-reply@jginfosys.com'

   def successful_campaign_email
     #@user = params[:user]

     @url  = 'https://desolate-journey-54830.herokuapp.com/'
    # mail(to: @user.email, subject: 'The campaign was a success...')
    mail(to: "merlin2049er@gmail.com" , subject: 'The campaign was a success...')
   end

end
