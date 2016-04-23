class Pet < ActiveRecord::Base
  has_many :favorites
  has_many :users, through: :favorites
  VALID_NAME_REGEX = /\A[a-zA-Z\-.\s]+\z/
  enum species: [:dog, :cat]
  enum sex: [:male, :female]
  enum size: [:small, :medium, :large]
  enum fixed: [:neutered, :spayed]
  validates :sex, presence: true, inclusion:     { in: sexes.keys }
  validates :size, presence: true, inclusion:    { in: sizes.keys }
  validates :species, presence: true, inclusion: { in: species.keys }
  validates :fixed, presence: true, inclusion:  { in: fixeds.keys }
  validates :breed, presence: true, format:     { with: VALID_NAME_REGEX }
  validates :name, presence: true, format:      { with: VALID_NAME_REGEX }
  validates :bio, presence: true, length:       { minimum: 13, maximum: 500 }
  validates :age, presence: true, numericality: { only_integer: true, greater_than: 0, less_than: 193 }
  validates :weight, presence: true, numericality: { only_integer: true, greater_than: 0, less_than: 130 }
end
