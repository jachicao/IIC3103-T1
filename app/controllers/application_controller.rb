class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_admin
  before_filter :set_cache_headers

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin
    	@is_admin = session[:is_admin]
    end

	def set_cache_headers
	  response.headers["Cache-Control"] = "no-cache, no-store, max-age=0, must-revalidate"
	  response.headers["Pragma"] = "no-cache"
	  response.headers["Expires"] = "Fri, 01 Jan 1990 00:00:00 GMT"
	end
end
