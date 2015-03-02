module CurrentAlbum extend ActiveSupport::Concern
  protected
  def get_current_albums
    albums = Album.all
    @album_names = Hash.new
    albums.each do |album|
      @album_names[album.title] = album.id
    end
    @album_names
  end

def get_albums_for_nav
  albums = Album.all
  @album_names = Hash.new
  albums.each do |album|
    @album_names[album.title] = album.address
  end
  @album_names
end

end