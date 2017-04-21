class AlbumsController < ApplicationController
  def new
    @album = Album.new
    render :new
  end

  def create

    @album = Album.new(album_params)
    if @album.save
      redirect_to band_url(@album.artist)
    else
      flash[:errors] = @album.errors.full_messages
      render :new
    end
  end

  def edit
    @album = Album.find_by(params[:id])
    render :edit
  end

  def update
    @album = Album.find_by(params[:id])
    if @album
      @album.update_attributes(album_params)
      redirect_to album_url
    else
      flash[:errors] = @album.errors.full_messages
      render :edit
    end
  end

  def show
    @album = Album.find_by(params[:id])
    render :show
  end

  def destroy
    @album = Album.find_by(params[:id])
    @album.destroy

  end



  private

  def album_params
    params.require(:album).permit(:title, :format, :artist_id)
  end

end
