class FavoritesController < ApplicationController
  def index
    if !signed_in?

      redirect '/login'

    else
      @user = current_user()

      erb :'favorites/index'
    end
  end

  def new
    erb :'favorites/new'
  end

  def create
    @user = User.find(session[:user_id])
    @game = Game.find(params[:game_key])
    @user.favorites << @game

    redirect '/users/:id'
  end

  # def show
  # end

  # def edit
  # end

  # def update
  # end

  def destroy
    @user = current_user()
    @favorite = Favorite.where(user_id: @user.id,game_id: params[:game_key])
    p @favorite
    @favorite[0].destroy

    redirect '/users/:id'
  end
end
