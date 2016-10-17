class PrototypesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :new, :create, :show]

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
    @prototype = Prototype.find(params[:id])
  end

  private
  def prototype_params
    params.require(:prototype).permit(:name, :concept, :catch_copy, :user_id, prototype_images_attributes: [:id, :image, :status])
  end

end
