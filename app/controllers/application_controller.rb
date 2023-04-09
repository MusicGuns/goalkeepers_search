class ApplicationController < ActionController::Base
  include Pundit::Authorization
  before_action do
    ActiveStorage::Current.url_options = { protocol: request.protocol, host: request.host, port: request.port }
  end

  def redirect_to_authenticate_user!
    return if current_user

    flash[:alert] = 'Для этого действия вам необходимо авторизоваться и зарегистрироваться'
    redirect_to new_user_session_path
  end
end
