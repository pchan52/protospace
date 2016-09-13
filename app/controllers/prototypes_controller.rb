class PrototypesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :new, :create, :show]

  def index
  end

  def new
    @prototype = Prototype.new
  end

  def create
    @prototype = Prototype.new(prototype_params)
  end

  def show
  end

  private
  def prototype_params
    params.require(:prototype).permit(:name, :concept, :catch_copy, :likes_count, :user_id, prototype_images_attributes: [:prototype_id, :image, :status])
  end

end
