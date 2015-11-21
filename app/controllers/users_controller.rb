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
      UserSendEmailJob.set(wait: 10.seconds).perform_later(@user.id)
      flash[:notice] = "You have succesfully signed up."
      login(@user)
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = current_user
  end

  def update
    if current_user.update(user_params)
      redirect to @user
    else
    render :edit
    end
  end

  def destroy
  end

  private

  def user_params
    params.require(:user)
        .permit(:username, :email, :password, :password_confirmation, :avatar, :fbpic)
  end
end
