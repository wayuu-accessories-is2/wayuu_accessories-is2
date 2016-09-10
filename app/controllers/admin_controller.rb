class AdminController < ApplicationController

  before_action :require_admin, only: [:admin_index]

  def admin_index
  end

end
