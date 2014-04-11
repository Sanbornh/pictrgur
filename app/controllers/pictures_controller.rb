class PicturesController < ApplicationController

  def index
    @picture = Picture.order("Random()").first
  end

  def show
    @picture = Picture.find(params[:id])
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.new(picture_params)
    if @picture.save
      redirect_to picture_url(@picture[:id])
    else
      render :new
    end
  end

  def edit

  end

  def update
  end

  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy
    redirect_to picture_url
  end

  private

  def picture_params
    params.require(:picture).permit(:artist, :title, :url) 
  end

end