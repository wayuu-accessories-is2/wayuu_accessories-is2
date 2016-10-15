class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:facebook, :google_oauth2]
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  #before_action :authenticate_user!
#  before_create :generate_authentication_token!
  #before_filter :authenticate_user!
  has_many :review
  belongs_to :customer, optional: true



  def self.find_for_facebook_oauth(auth)
    user = User.where(provider: auth.provider, uid: auth.uid).first
    # The User was found in our database
    return user if user
    # Check if the User is already registered without Facebook
    user = User.where(email: auth.info.email).first
    return user if user
    user = User.new(
         name: auth.extra.raw_info.name,
         provider: auth.provider, uid: auth.uid,
         email: auth.info.email,
         password: Devise.friendly_token[0,20])
    user.skip_confirmation!
    user.save
    user
   end

#=end
#  def self.create_with_omniauth(auth)
  #  create! do |user|
#      user.provider = auth["provider"]
#      user.uid = auth["uid"]
#      user.name = auth["info"]["name"]
#    end
#  end


#  private
  #  def generate_authentication_token!#
  #      begin
  #      self.auth_token = Devise.friendly_token
    #  end while self.class.exists?(auth_token: auth_token)
  #  end


    def admin?
      self.role == 53
    end

    def linguist?
      self.role == 7
    end


end
