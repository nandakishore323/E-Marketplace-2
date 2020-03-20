require 'cloudinary'

class Product < ApplicationRecord
  validates :title, :description, :subject, :price, presence: true
  validates :price, numericality: { only_integer: true }

  has_many :comments, dependent: :destroy
  has_many :replies, dependent: :destroy
  belongs_to :user
  has_one_attached :image

  def image_tag
    cl_image_tag(self.image.key, width: 730, crop: "fit")
  end

  def thumb_tag
    cl_image_tag(self.image.key, width: 300, crop: "fit")
  end

  def self.search(search)
    if search
     where(["title LIKE ?","%#{search}%"])
    else
      all
    end
  end
end
