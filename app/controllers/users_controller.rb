class UsersController < ApplicationController
  include ApplicationHelper

  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "You have succesfully signed up."
      login(@user)
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    render layouts: "application"
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def user_params
    params.require(:user)
        .permit(:username, :email, :password, :password_confirmation, :avatar)
  end
end
