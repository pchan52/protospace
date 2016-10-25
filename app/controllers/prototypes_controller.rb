class PrototypesController < ApplicationController
  before_action :authenticate_user!, except: :destory
  before_action :set_prototype, only: %i(show edit update)

  def index
    @prototypes = Prototype.all
  end

  def new
    @prototype = Prototype.new
    @main_content = @prototype.prototype_images.build
    @sub_contents = 2.times { @prototype.prototype_images.build }
  end

  def create
    @prototype = current_user.prototypes.new(prototype_params)
    if @prototype.save
      redirect_to :root
    else
      redirect_to new_prototype_url
    end
  end

  def show
     @like  = @prototype.likes.find_by(user_id: current_user.id)
  end

  def edit
    @main_content = @prototype.prototype_images.first
    @sub_contents = @prototype.prototype_images.sub
  end

  def update
    if @prototype.update(prototype_params)
       redirect_to action: 'show'
    else
       render action: 'edit'
    end
  end

  def destroy
    @prototype = Prototype.find(params[:id])
    if @prototype.destroy
      redirect_to :root
    else
      redirect_to action: 'show'
    end
  end

  private
  def prototype_params
    params.require(:prototype).permit(
    :name,
    :concept,
    :catch_copy,
    :user_id,
    :created_at,
    :likes_count,
    prototype_images_attributes: [:id, :image, :status])
  end

  def set_prototype
    @prototype = Prototype.find(params[:id])
  end
end
