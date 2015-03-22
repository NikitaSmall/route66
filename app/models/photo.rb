class Photo < ActiveRecord::Base
  belongs_to :album

  validates :title, :photo, :album_id, presence: true
  has_attached_file :photo, #:styles => { :small => "150x150>" },
                    :default_url => "/images/:basename.:extension",
                    :url  => ":s3_domain_url",
                    :path => "public/images/:basename.:extension",
                    :storage => :fog,
                    :fog_credentials => {
                        :provider => 'AWS',
                        :aws_access_key_id => ENV["aws_access_key_id"],
                        :aws_secret_access_key => ENV["aws_secret_access_key"]
                    },
                    :fog_directory => ENV["FOG_DIRECTORY"]

  validates_attachment_size :photo, :less_than => 5.megabytes
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']



end
