class Album < ActiveRecord::Base
  has_many :photos, dependent: :destroy
  validate :title, :address, presence: true
  validate :title, :address, uniqueness: true

end
