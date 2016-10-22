class BlogController < ApplicationController

  #before_action :authenticate_user!
  #before_action :require_admin

  def add
    respond_to do |format|
    	format.js
    end
  end

  def new

  end

end
