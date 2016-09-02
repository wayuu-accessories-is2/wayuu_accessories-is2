class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,:confirmable,
         :omniauthable, omniauth_providers: [:facebook]

  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    user = User.where(provider: auth.provider, uid: auth.uid).first
    # The User was found in our database
    return user if user
    # Check if the User is already registered without Facebook
    user = User.where(email: auth.info.email).first
    return user if user
    User.create(
         name: auth.extra.raw_info.name,
         provider: auth.provider, uid: auth.uid,
         email: auth.info.email,
         password: Devise.friendly_token[0,20])
  end


#  def self.from_omniauth(auth, signed_in_resource=nil)
#    user = User.where(provider: auth.provider, uid: auth.uid).first
#    return user if user
#    User.create(
#      provider: auth.provider,
#      uid: auth.uid,
#      name: auth.info.name,
#      oauth_token: auth.credentials.token,
#      oauth_expires_at: Time.at(auth.credentials.expires_at))
#  end

  has_many :review
  belongs_to :customer, optional: true
end
