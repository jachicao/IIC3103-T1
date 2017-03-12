class AdministratorController < ApplicationController

  # GET /administrator
  def index
    @articles = Article.all
  end
  
  def login
    session[:is_admin] = true
    @is_admin = true
    redirect_back(fallback_location: root_path)
  end

  def logout
    session[:is_admin] = false
    @is_admin = false
    redirect_back(fallback_location: root_path)
  end
end
