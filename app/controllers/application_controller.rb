class ApplicationController < ActionController::Base

  protect_from_forgery with: :null_session, prepend: true
  helper_method :current_user

  private
    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def require_user
      redirect_to root_path unless current_user
    end

    def require_admin
      redirect_to root_path unless current_user.admin?
    end

    def require_linguist
      redirect_to root_path unless current_user.linguist?
    end
end
