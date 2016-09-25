class AdminController < ApplicationController

  #before_action :require_admin, only: [:admin_index]

  def admin_index

  end

  def userlist
    @userslist = User.all
  end

  def beadmin
    a = User.find(params[:id])
    a.role = 53
    a.save
    redirect_to userlist_admin_index_path
  end

  def removeadmin
    a = User.find(params[:id])
    a.role = 7
    a.save
    redirect_to userlist_admin_index_path
  end

end
