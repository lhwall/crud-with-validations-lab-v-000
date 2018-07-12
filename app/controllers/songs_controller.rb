class SongsController < ApplicationController

  def index
    @songs = Song.all
  end

  def show
    @song = Song.find(params[:id])
  end

  def edit
    @song = Song.find(params[:id])
  end

  def update
    @song = Song.find(params[:id])
    @song.update(params)
    if @song.valid?
      redirect_to song_path(@song )
    else
      render :edit
    end
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(params)
    if @song.valid?
      redirect_to song_path(@song)
    else
      render :new
    end
end
