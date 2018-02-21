class SongsController < ApplicationController
  def create
    @playlist = Playlist.find(params[:playlist_id])
    @song = Song.new(song_params)
    @song.playlist = @playlist
    @song.save
    redirect_to @playlist, notice: 'Song created.'
  end

  def destroy
    @playlist = Playlist.find(params[:playlist_id])
    @song = Song.find(params[:id])
    @song.destroy
    redirect_to @playlist, notice: 'Song Deleted!'
  end

  private

  def song_params
    params.require(:song).permit(:artist, :name)
  end
end
