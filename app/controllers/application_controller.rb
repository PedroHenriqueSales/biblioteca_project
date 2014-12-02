class ApplicationController < ActionController::Base
  private

  def require_signin
    unless current_user
      redirect_to new_session_url, alert: "Por favor, faça o login primeiro"
    end
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user
  helper_method :current_user_admin?
  def require_admin
    unless current_user_admin?
      redirect_to books_url, notice: "Acesso não autorizado!"
    end
  end

  def current_user_admin?
    current_user && current_user.admin?
  end

end
