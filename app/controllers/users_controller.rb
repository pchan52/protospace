class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update]

  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  def update
    @user.update(update_params)
  end

  private
  def update_params
    params.require(:user).permit(:name, :emal, :password, :works, :profile, :avatar, :member)
  end
end
