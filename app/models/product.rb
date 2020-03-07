class Product < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  validates :subject, presence: true

  has_many :comments
  belongs_to :user
  has_one_attached :image
end
