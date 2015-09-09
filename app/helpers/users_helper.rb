module UsersHelper
  def signin
    @user = User.find_by(username: params[:username])

    if @user && @user.password == params[:password]
      session[:user_id] = @user.id

    else
      @form_error = "Username or password is invalid."
    end

  end


  def signout
    session.destroy
  end


  def current_user
    if session[:user_id]
      User.find_by(id: session[:user_id])
    else
      nil
    end
  end


  def signed_in?
    @user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end
end
