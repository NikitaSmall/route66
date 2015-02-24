class ApplicationController < ActionController::Base
  include CurrentAlbum
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :get_albums

  protected
  def get_albums
    @albumes = get_current_albums
  end
end
