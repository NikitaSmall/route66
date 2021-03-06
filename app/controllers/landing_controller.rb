class LandingController < ApplicationController
  def index
    if params[:address]
      album = Album.find_by_address(params[:address])
      if album.nil?
        @photos = nil
      else
        @photos = Photo.where(album_id: album.id).order(created_at: :desc)
        #@layout = get_layout_length(@photos.length)
      end
    else
      @photos = Photo.first
    end

  end

  def all
    @photos = Photo.all.order(created_at: :desc)
  end

  def about
  end

  def contacts
  end

  def send_message
    if ContactsMessage.send_a_mail(params[:name], params[:title], params[:body]).deliver
      redirect_to :contacts, notice: 'Ваше письмо отправлено.'
    end
  end

  def get_layout_length(length)
    rows = (length / 2)
    i = 0
    @layout = String.new("")
    rows.times do
      if i.odd?
        @layout = @layout.concat('2')
        else
        @layout = @layout.concat('3')
      end
      i += 1
    end
    return @layout
  end
end
