class Idea < ApplicationRecord
  validates :name, :description, presence: true
  belongs_to :user
  belongs_to :category
end
