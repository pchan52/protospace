class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update]
  before_action :get_user, only: [:show, :edit, :update]

  def show
    @prototypes = @user.prototypes.page(params[:page])
    @proto_count = @user.prototypes.count
  end

  def edit
  end

  def update
    @user.update(update_params)
    redirect_to user_url(current_user), flash:{ success: 'Success update' }
  end

  private
  def get_user
    @user = User.find(params[:id])
  end

  def update_params
    params.require(:user).permit(:name, :emal, :password, :works, :profile, :avatar, :member)
  end
end
