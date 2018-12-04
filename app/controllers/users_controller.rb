class UsersController < ApplicationController
  def index

  end

  def show
  	@user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:email, :fname, :lname, :username, :phone)
  end

end
