class LikesController < ApplicationController
  before_action :authenticate_user!, only: %(create, destroy)
  before_action :set_prototype, only: %(create, destroy)

  def create
    @prototype = Prototype.find(params[:prototype_id])
    @like = @prototype.likes.create(user_id: current_user.id)
  end

  def destroy
    like = Like.find(params[:id])
    like.destroy
    @prototype = Prototype.find(params[:prototype_id])
  end

  private

  def set_prototype
    @prototype = Prototype.find(params[:prototype_id])
  end
end
