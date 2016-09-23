class Users::RegistrationsController < Devise::RegistrationsController

# before_action :configure_sign_up_params, only: [:create]
# before_action :configure_account_update_params, only: [:update]

#  def finish_signup
#    if request.patch? && params[:user] # Revisa si el request es de tipo patch, es decir, llenaron el formulario y lo ingresaron
#      @user = User.find(params[:id])
#
#      if @user.update(user_params)
#        sign_in(@user, :bypass => true)
#        redirect_to root_path, notice: 'Hemos guardado tu email correctamente.'
#      else
#        @show_errors = true
#      end
#    end
#  end
#
#  private
#    def user_params
#      accessible = [ :name, :email ] # extend with your own params
#      accessible << [ :password, :password_confirmation ] unless params[:user][:password].blank?
#      params.require(:user).permit(accessible)
#    end


  # GET /resource/sign_up
  #def new
  #   super
     #render layout: "admin"
     #return
   #end

  # POST /resource

  #def create
#    build_resource(registration_params)
#    if resource.save
#      if resource.active_for_authentication?
#        sign_up(resource_name, resource)
#        respond_with resource, :location => after_sign_up_path_for(resource)
#      else
#        set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_navigational_format?
#        redirect_to root_path
#      end
#    else
#      respond_with resource
#    end
#  end

  #private

  def registration_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected



  # If you have extra params to permit, append them to the sanitizer.
   def configure_sign_up_params
     devise_parameter_sanitizer.permit(:sign_up) do |user|
      user.permit(:name, :email, :password, :password_confirmation)
     end
   end

  # If you have extra params to permit, append them to the sanitizer.
   def configure_account_update_params
     devise_parameter_sanitizer.permit(:account_update) do |user|
      user.permit(:name, :email, :password, :password_confirmation)
     end
   end

  # The path used after sign up.
   #def after_sign_up_path_for(resource)
  #   redirect_to root_path
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
