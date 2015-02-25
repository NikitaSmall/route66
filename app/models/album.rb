class Album < ActiveRecord::Base
  has_many :photos
  validate :title, presence: true
  validate :title, uniqueness: true

end
