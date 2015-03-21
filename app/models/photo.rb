class Photo < ActiveRecord::Base
  belongs_to :album

  validates :title, :photo, :album_id, presence: true
  has_attached_file :photo, #:styles => { :small => "150x150>" },
                    :url  => "/assets/images/:basename.:extension",
                    :path => "/assets/images/:basename.:extension",
                    :storage => :s3,
                    :s3_credentials => {
                        :bucket => 'route67',
                        :access_key_id => 'AKIAIYDIPBOEM6L7DSGQ',
                        :secret_access_key => '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'
                    }

  validates_attachment_size :photo, :less_than => 5.megabytes
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']



end
