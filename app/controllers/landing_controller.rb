class LandingController < ApplicationController
  def index
    if params[:album]
      album = Album.find_by_title(params[:album])
      @photos = Photo.where(album_id: album.id)
    else
      @photos = Photo.first
    end
  end

  def about
  end

  def contacts
  end
end
