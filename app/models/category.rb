class Category < ApplicationRecord
  validates :name, uniqueness: { case_sensitive: false}, presence: true
  validates :description, presence: true
  has_many :ideas, dependent: :destroy
end
