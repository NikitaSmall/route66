class Photo < ActiveRecord::Base
  belongs_to :album

  validates :title, :photo, :album_id, presence: true
  has_attached_file :photo, #:styles => { :small => "150x150>" },
                    :url  => "/assets/images/:basename.:extension",
                    :path => ":rails_root/public/assets/images/:basename.:extension"

  validates_attachment_size :photo, :less_than => 5.megabytes
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']



end
