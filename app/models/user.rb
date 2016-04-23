class User < ActiveRecord::Base
  has_many :favorites
  has_many :pets, through: :favorites
  before_save { email.downcase! }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
            format: { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }
  has_secure_password

  def favorite(pet)
    favorites.create(pet_id: pet.id)
  end
end
