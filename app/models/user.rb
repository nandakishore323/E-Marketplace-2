class User < ApplicationRecord
  has_many :products
  has_many :comments, dependent: :destroy
  validates :name, presence: true
  mount_uploader :avatar, AvatarUploader
  validates_presence_of   :avatar
  validates_integrity_of  :avatar
  validates_processing_of :avatar

  has_many :replies, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:facebook]
         validates :name, :preferred_name, presence: true

  def self.create_from_provider_data(provider_data)
    where(provider: provider_data.provider , uid: provider_data.uid).first_or_create do |user|
      user.email = provider_data.info.email
      user.password = Devise.friendly_token[0, 20]
      user.name = auth.info.name   # assuming the user model has a name
      user.remote_avatar_url = auth.info.image
      user.skip_confirmation
    end
  end
end
