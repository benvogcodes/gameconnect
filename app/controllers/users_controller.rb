class UsersController < ApplicationController
  def index
    if signed_in?

      @user = current_user()
      redirect "/users/#{@user.id}"

    else
      erb :'/users/index'
    end
  end

  def new
    if signed_in?

      @user = current_user()

      redirect "/users/#{@user.id}"

    else
      erb :'users/new'
    end
  end

  def create
    p params
    p session
    @user = User.create(username: params[:username],password: params[:password],email: params[:email])

    signin()
    p @user
    redirect "/users/#{@user.id}"
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
end
