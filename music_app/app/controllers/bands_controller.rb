class BandsController < ApplicationController
  def index
    @bands = Band.all
    render :index
  end

  def new
    @band = Band.new
    render :new
  end

  def create
    @band = Band.new(band_params)
    if @band.save
      flash[:success] = "Object successfully created"
      redirect_to band_url(@band)
    else
      flash[:error] = "Something went wrong"
      render :new
    end
  end
  

  def edit
    @band = Band.find(params[:id])
    render :edit
  end

  def update
    @band = Band.find(params[:id])
    if @band.update
      redirect_to band_url(@band)
    else
      render :edit
    end
  end


  def show
    @band = Band.find(params[:id])
    render :show
  end

  private

  def band_params
    params.require(:band).permit(:name)
  end
end
