class AlbumsController < ApplicationController
  def new
    @album = Album.new
    render :new
  end

  def create
    @album = Album.new(album_params)
    if @album.save
      redirect_to album_url(@album)
    else
      render :new
    end
  end

  def edit
    @album = Album.find(params[:id])
    render :edit
  end

  def update
    @album = Album.find(params[:id])
    if @album.update
      redirect_to album_url(@album)
    else
      render albums_url
    end
  end

  def show
    @album = Album.find(params[:id])
    render :show
  end

  private

  def album_params
    params.require(:album).permit(:band_id, :title, :year, :live)
  end
end
