class GamesController < ApplicationController
  def index
    if signed_in?

      @user = current_user()
      erb :'games/index'

    else
      redirect "/login"
    end
  end

  def new
    erb :'games/new'
  end

  def create
    @user = current_user()

    @game = Game.create(title: params[:title],platform: params[:platform], developer:params[:developer],genre: params[:genre])

    redirect "/users/#{@user.id}"
  end

  # def show
  # end

  # def edit
  # end

  # def update
  # end

  # def destroy
  # end
end
