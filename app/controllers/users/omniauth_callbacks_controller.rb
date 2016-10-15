class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # You should configure your model like this:
  # devise :omniauthable, omniauth_providers: [:twitter]
#=begin
  #before_filter :authenticate_user!
  include ApplicationHelper

  def facebook
    # Attempt to find the User
    @user = User.find_for_facebook_oauth(env["omniauth.auth"] )

    if @user.persisted?
      sign_in_and_redirect @user,
        :event => :authentication
      set_flash_message(:notice,
        :success,
        :kind => "Facebook") if is_navigational_format?
    else
      session[:user_id] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end

  end

  def passthru
    render :file => "#{Rails.root}/public/404.html", :status => 404, :layout => false
  end

  def google_oauth2
      # You need to implement the method below in your model (e.g. app/models/user.rb)
      @user = User.from_omniauth(request.env["omniauth.auth"])

      if @user.persisted?
        flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Google"
        sign_in_and_redirect @user, :event => :authentication
      else
        session[:user_id] = request.env["omniauth.auth"]
        redirect_to new_user_registration_url
      end
  end

#  def self.from_omniauth(access_token)
#    data = access_token.info
#    user = User.where(:email => data["email"]).first
    # Uncomment the section below if you want users to be created if they don't exist
#    unless user
#            user = User.create(name: data["name"],
#            email: data["email"],
#            password: Devise.friendly_token[0,20])
#    end
#    user
#  end
#=end

  # You should also create an action method in this controller like this:
  # def twitter
  # end

  # More info at:
  # https://github.com/plataformatec/devise#omniauth

  # GET|POST /resource/auth/twitter
  # def passthru
  #   super
  # end

  # GET|POST /users/auth/twitter/callback
  # def failure
  #   super
  # end

  # protected

  # The path used when OmniAuth fails
  # def after_omniauth_failure_path_for(scope)
  #   super(scope)
  # end
end
