# coding: utf-8
class PhotosController < ApplicationController
  include CurrentAlbum
  before_action :set_photo, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /photos
  # GET /photos.json
  def index
    @albums = Album.all
    #@albums['Все альбомы'] = 0
    #@albums = @albums.sort_by {|_key, value| value}.to_h

    if params[:album_id]
      if params[:album_id].to_f == 0
        @photos = Photo.paginate(:page => params[:page], :per_page => 5)
      else
        @photos = Photo.where(album_id: params[:album_id].to_i).paginate(:page => params[:page], :per_page => 5)
      end
    else
      @photos = Photo.paginate(:page => params[:page], :per_page => 5)
    end
  end

  # GET /photos/1
  # GET /photos/1.json
  def show
  end

  # GET /photos/new
  def new
    @photo = Photo.new
    @albums = get_current_albums
  end

  # GET /photos/1/edit
  def edit
    @albums = get_current_albums
  end

  # POST /photos
  # POST /photos.json
  def create
    @photo = Photo.new(photo_params)
    @albums = get_current_albums

    respond_to do |format|
      if @photo.save
        format.html { redirect_to photos_url, notice: 'Фотография была успешно добавлена.' }
        format.json { render action: 'show', status: :created, location: @photo }
      else
        format.html { render action: 'new' }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /photos/1
  # PATCH/PUT /photos/1.json
  def update
    @albums = get_current_albums
    respond_to do |format|
      if @photo.update(photo_params)
        format.html { redirect_to photos_url, notice: 'Фотография была успешно обновлена.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /photos/1
  # DELETE /photos/1.json
  def destroy
    @photo.photo.destroy
    @photo.destroy
    respond_to do |format|
      format.html { redirect_to photos_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_photo
      @photo = Photo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def photo_params
      params.require(:photo).permit(:title, :photo, :album_id)
    end
end
