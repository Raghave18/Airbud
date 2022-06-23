class BuddiesController < ApplicationController

  def index
    @buddies = Buddy.all
  end

  def show
    @buddy = Buddy.find(params[:id])
  end

  def new
    @buddy = Buddy.new
  end

  def create
    @buddy = Buddy.new(buddy_params)
    @buddy.user = current_user
    if @buddy.save
      redirect_to buddy_path(@buddy)
    else
      render :new
    end
  end

  def edit
    @buddy = Buddy.find(params[:id])
  end

  def update
    @buddy = Buddy.find(params[:id])
    if @buddy.update(buddy_params)
      redirect_to @buddy, notice: 'Buddy successfully updated'
    else
      render :edit
    end
  end

  private

  def buddy_params
    params.require(:buddy).permit(:name, :buddy_type, :skills, :description, :activities, :rate)
  end
end
