class Album < ActiveRecord::Base
  has_many :photos, dependent: :destroy
  validate :title, presence: true
  validate :title, uniqueness: true

end
