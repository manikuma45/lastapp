class User < ApplicationRecord

  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  before_validation { email.downcase! }
  validates :encrypted_password,  presence: true, length: { maximum: 30 }
  validates :address,  presence: true, length: { maximum: 255 }
  validates :icon,  presence: true
  validates :birthed_at,  presence: true
  validates :name,  presence: true, length: { maximum: 50 }
  validates :sex,  presence: true, length: { maximum: 10 }
  validates :mobile_number,  presence: true, length: { maximum: 50 }
  validates :introduction,  presence: true, length: { maximum: 50 }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  has_many :events
  has_many :movies
  mount_uploader :icon, ImageUploader

  has_many :favorite_events, dependent: :destroy
  has_many :favorite_movies, dependent: :destroy

end
