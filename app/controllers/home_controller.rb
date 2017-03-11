class HomeController < ApplicationController

  def administrate
    session[:is_admin] = true
    putc 'peneeee'
    redirect_to root_url
  end

  def logout
    session[:is_admin] = false
    redirect_to root_url
  end
end
