class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable,
         :omniauthable, omniauth_providers: [:facebook]

  has_many :notifications
  has_many :transactions
  has_many :troubletickets

  acts_as_commontator

  # IT'S JUST AN EXAMPLE OF ANY ROLE SYSTEM
def admin?
 self == User.first
end

def is_profile_complete
  if !self.firstname.blank? and !self.lastname.blank? and !self.username.blank? and !self.address1.blank? and !self.city.blank? and !self.state.blank? and !self.postal.blank? and !self.country.blank?
      return true
  else
      return false
  end
end

# YOU HAVE TO IMPLEMENT YOUR ROLE POLICY FOR COMMENTS HERE
def comments_admin?
 admin?
end

def comments_moderator? comment
 id == comment.holder_id
end

def self.new_with_session(params, session)
  super.tap do |user|
    if data = session['devise.facebook_data'] && session['devise.facebook_data']['extra']['raw_info']
      user.email = data['email'] if user.email.blank?
    end
  end
  end

def self.from_omniauth(auth)
  where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
    user.email = auth.info.email
    user.password = Devise.friendly_token[0, 20]
    user.firstname = auth.info.first_name # assuming the user model has a name
    user.lastname = auth.info.last_name # assuming the user model has a name
    user.image = auth.info.image # assuming the user model has an image
    # If you are using confirmable and the provider(s) you use validate emails,
    # uncomment the line below to skip the confirmation emails.
    user.skip_confirmation!
    user.save!
  end
end

def set_defaults
  self.image ||= 'photo_not_available.png'
end
# include PublicActivity::Model
#  tracked owner: ->(controller,model) {controller && controller.current_user}

end
