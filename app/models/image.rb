class Image < ApplicationRecord
  validates :name, presence: true
  validates :url, uniqueness: true, presence: true
end
