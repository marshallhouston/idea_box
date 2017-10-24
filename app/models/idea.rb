class Idea < ApplicationRecord
  validates :name, :description, presence: true
  belongs_to :user
  belongs_to :category
  has_many :idea_images
  has_many :images, through: :idea_images
end
