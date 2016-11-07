module ManagerSessionsHelper
	 #log a given user
  def log_manager(manager)
    session[:manager_id] = manager.id
  end

  #remember a user in a session
  def remember(manager)
    manager.remember
    cookies.permanent.signed[:manager_id] = manager.id
    cookies.permanent[:remember_token] = manager.remember_token
  end

  #returns true if the given user is the current user
  def current_manager?(manager)
    manager == current_manager
  end


  #return the current login user
  def current_manager
    if (manager_id = session[:manager_id])
      @current_manager ||= Manager.find_by(id: session[:manager_id])
    elsif (manager_id = cookies.signed[:manager_id])
      manager = Manager.find_by(id: manager_id)
      if manager && manager.authenticated?(cookies[:remember_token])
        log_manager(manager)
        @current_manager = manager
      end
    end

  end


  #return true if user is logged in
  def logged_manager?
    !current_manager.nil?
  end

  #forget a session
  def forget(manager)
    manager.forget #calling the model method
    cookies.delete(:manager_id)
    cookies.delete(:remember_token)
  end

  #log out the current user
  #this method is used in session controller, to delete users session
  def manager_out
    forget(current_manager)
    session.delete(:manager_id)
    @current_manager = nil
  end


  #redirects to stored location or default
  def redirect_back_or(default)
    redirect_to(session[:forwarding_url] || default)
    session.delete(:forwarding_url)
  end

  #store the url the user wanted to visit
  def store_location
    session[:forwarding_url] = request.original_url if request.get?
  end
end
