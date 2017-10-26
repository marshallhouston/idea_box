class Image < ApplicationRecord
  validates :name, presence: true
  validates :url, uniqueness: true, presence: true
  has_many :idea_images, dependent: :destroy
  has_many :ideas, through: :idea_images

end
