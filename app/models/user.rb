class User < ApplicationRecord
  validates :name, presence: true
  validates :email, uniqueness: { case_sensitive: false }, presence: true
  has_secure_password
  has_many :ideas

  enum role: ["default", "admin"]
end
