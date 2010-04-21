module Authenticate

  def self.included(base)
    base.class_eval do
      helper_method :current_user
      before_filter :require_user
    end
  end

protected
  def require_user

    unless current_user
      respond_to do |format|
        format.html do
          store_location
          flash[:notice]  = "You must be logged in to acess this page"
          redirect_to login_path
        end

        format.any(:xml,:json,:rss) do
          authenticate_or_request_with_http_basic do |user,password|
            @user_session = UserSession.new(:login=>user, :password=>password)
            @user_session.save
          end 
        end
      end
    end
  end
private

  def current_user_session
    @current_user ||= UserSession.find
  end

  def current_user
    @current_user ||= current_user_session && current_user_session.record
  end

  def store_location
    session[:return_to]   = request.request_uri
  end

  def redirect_back_or_default(default)
    redirect_to(session[:return_to] || default)
    session[:return_to]   = nil
  end
end