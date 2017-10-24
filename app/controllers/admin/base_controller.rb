class Admin::BaseController < ApplicationController

  before_action :check_admin

  def check_admin
    if !current_user.admin?
      render file: "#{Rails.root}/public/404", layout: false, status: :not_found
    end
  end
  
end
