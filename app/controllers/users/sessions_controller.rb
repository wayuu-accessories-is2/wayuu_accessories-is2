class Users::SessionsController < Devise::SessionsController
# before_action :configure_sign_in_params, only: [:create]

  #before_action :configure_sign_in_params, only: [:create]

  def create
  #  user = User.from_omniauth(env["omniauth.auth"])
    emai = params[:user][:email]
    session[:user_id] = User.find_by(email: emai).id
    redirect_to root_path
    #rescue Exception => e
  #    flash[:error] = e.message
  #    render :new
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  # GET /resource/sign_in
  #def new
  #   super
  #end

  # POST /resource/sign_in
   #def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
