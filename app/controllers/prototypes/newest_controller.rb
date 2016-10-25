class Prototypes::NewestController < ApplicationController
  def index
    @prototypes = Prototype.includes(:user).order('created_at DESC')
    render "prototypes/index"
  end
end
