class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_admin

  def administrate
    session[:is_admin] = true
  end

  def logout
    session[:is_admin] = false
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin
    	@is_admin = session[:is_admin]
    end
end
