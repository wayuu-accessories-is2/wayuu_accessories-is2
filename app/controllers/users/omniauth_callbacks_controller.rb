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
     #@user = User.connect_to_google(request.env["omniauth.auth"])
      @user = User.from_omniauth(env["omniauth.auth"])

     if @user.persisted?
        sign_in_and_redirect @user, event: :authentication
       #flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Google"
       set_flash_message(:notice, :success, kind: "Google".capitalize) if is_navigational_format?
     else
       session["devise.google_data"] = request.env["omniauth.auth"]
       redirect_to new_user_registration_url
     end
  end



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
