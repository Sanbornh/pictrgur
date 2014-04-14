class PicturesController < ApplicationController

  def index
    @picture = Picture.random
  end

  def show
    @picture = Picture.find(params[:id])
  end

  def show_all
    @pictures = Picture.all
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
    @picture = Picture.find(params[:id])
  end

  def update
    @picture = Picture.find(params[:id])

    if @picture.update_attributes(picture_params)
      redirect_to pictures_path(:id)
    else
      render :update
    end
  end

  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy
    redirect_to pictures_url
  end

  private

  def picture_params
    params.require(:picture).permit(:artist, :title, :url) 
  end

end