class Comment < ApplicationRecord
  belongs_to :product
  belongs_to :user

  validates :body, presence: true, allow_blank: false
end
