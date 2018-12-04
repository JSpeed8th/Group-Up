class UsersController < ApplicationController
  def show
    @user = User.find(current_user.id)
    @parties = @user.events
  end

  def show
  	@user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:email, :fname, :lname, :username, :phone)
  end

end
