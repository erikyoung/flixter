class Course < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  has_one :image
  belongs_to :user
  has_many :sections
  
  
  validates :title, presence: true
  validates :description, presence: true
  validates :cost, presence: true, numericality: {greather_than_or_equal_to: 0}
end
