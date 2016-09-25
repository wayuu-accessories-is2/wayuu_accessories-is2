class ApplicationController < ActionController::Base

  #protect_from_forgery with: :exception
  protect_from_forgery with: :null_session, prepend: true
  helper_method :current_user
  helper_method :addtocart

  def addtocart
    id = params[:id]
    current_cart
    session[:cart][id] = 1

    puts session[:cart]
  end

  private
    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def current_cart
      session[:cart]= {} if session[:cart] == nil
    end

    def require_user
      redirect_to root_path unless current_user
    end

    def require_admin
      if current_user != nil
        redirect_to root_path unless current_user.admin?
      else
        redirect_to root_path
      end
    end

    def require_linguist
      redirect_to root_path unless current_user.linguist?
    end
end
