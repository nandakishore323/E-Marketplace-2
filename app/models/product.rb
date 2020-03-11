class Product < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  validates :subject, presence: true

  has_many :comments
  belongs_to :user
  has_one_attached :image

  def image_tag
    cl_image_tag(self.image.key, width: 730, crop: "fit")
  end

  def thumb_tag
    cl_image_tag(self.image.key, width: 300, crop: "fit")
  end
end
