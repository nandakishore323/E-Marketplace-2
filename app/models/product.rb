class Product < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  validates :subject, presence: true

  belongs_to :user
end
