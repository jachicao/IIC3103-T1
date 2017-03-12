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
    response.headers["Surrogate-Control"] = "no-store"
    response.headers["Cache-Control"] = "no-store, no-cache, must-revalidate, proxy-revalidate"
    response.headers["Pragma"] = "no-cache"
    response.headers["Expires"] = "0"
    response.headers["X-XSS-Protection"] = "1; mode=block"
    if response.headers["X-Powered-By"]
      response.headers.delete("X-Powered-By")
    end
    response.headers["X-DNS-Prefetch-Control"] = "off"
    response.headers["X-Frame-Options"] = "SAMEORIGIN"
    response.headers["X-Content-Type-Options"] = "nosniff"
    response.headers["X-Download-Options"] = "noopen"
	end
end
