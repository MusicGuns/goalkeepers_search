class ApplicationController < ActionController::Base
  helper_method :current_user
  include Pundit::Authorization
  before_action do
    ActiveStorage::Current.url_options = { protocol: request.protocol, host: request.host, port: request.port }
  end

  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def redirect_to_authenticate_user!
    return if current_user

    flash[:alert] = 'Для этого действия вам необходимо авторизоваться и зарегистрироваться'
    redirect_to new_session_path
  end
end
