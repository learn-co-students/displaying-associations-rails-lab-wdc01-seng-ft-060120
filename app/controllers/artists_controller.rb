class ArtistsController < ApplicationController
  def index
    @artists=Artist.all
  end

  def show
    find_artist
  end

  def new
    @artist = Artist.new
  end

  def create
    @artist = Artist.new(artist_params)

    if @artist.save
      redirect_to artist_path(@artist)
    else
      render :new
    end
  end

  def edit
    @artist = Artist.find(params[:id])
  end

  def update
    @artist = Artist.find(params[:id])

    @artist.update(artist_params)

    if @artist.save
      redirect_to @artist
    else
      render :edit
    end
  end

  def destroy
    find_artist
    @artist.destroy
    flash[:notice] = "Artist deleted."
    redirect_to artists_path
  end

  private
  def find_artist
    @artist = Artist.find(params[:id]) 
  end

  def artist_params
    params.require(:artist).permit(:name)
  end
end
