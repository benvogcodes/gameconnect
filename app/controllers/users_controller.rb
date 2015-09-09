class UsersController < ApplicationController

  # before_filter :authorize, :except => [:index, :create]

  def index
    if signed_in?

      @user = current_user()
      redirect "/users/#{@user.id}"

    else
      erb :'/users/index'
    end
  end

  def new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to '/'
    else
      redirect_to '/signup'
    end
  end

  def show
    if !signed_in?

      redirect '/login'

    else
      @user = current_user()
      @favorite_games = Game.joins(:favorites,:users)

      erb :'users/show'
    end
  end

  # def edit
  # end

  # def update
  # end

  # def destroy
  # end

private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
