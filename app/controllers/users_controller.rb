class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(current_user.id)
    @parties = @user.events
  end

  def edit
    @user = User.find(current_user.id)
  end

  def update
    user = User.find(current_user.id)
    if user.update(user_params)
      redirect_to '/users/current_user.id'
    end
  end

  def destroy
    user = User.find(params[:id])
    if user.destroy
      redirect_to '/'
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :fname, :lname, :username, :phone)
  end

end
