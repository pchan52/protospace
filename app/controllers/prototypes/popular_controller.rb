class Prototypes::PopularController < ApplicationController
  def index
    @prototypes = Prototype.includes(:user).order('likes_count DESC').page(params[:page])
    render "prototypes/index"
  end
end
