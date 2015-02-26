class ApplicationController < ActionController::Base
  include CurrentAlbum
  utf8_enforcer_workaround
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :get_albums

  protected
  def get_albums
    @albumes = get_current_albums
  end

  protected
  def get_page
    if params[:album]
      @page = params[:album]
    else
      @page = action_name
    end
    @page
  end

end
