class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_admin

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin
    	@is_admin = true
    end
end
