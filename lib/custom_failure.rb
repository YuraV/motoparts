class CustomFailure < Devise::FailureApp

  def respond
    if http_auth?
      http_auth
    elsif params[:controller] == 'admin_panels'
      redirect_to new_user_session_path
    else
      flash[:error] = 'Access Deny'
      redirect_to root_path
    end
  end
end