class Pet < ActiveRecord::Base
  VALID_NAME_REGEX = /\A[a-zA-Z\-.\s]+\z/
  enum animal: [:dog, :cat]
  enum sex: [:male, :female]
  enum size: [:small, :medium, :large]
  validates :sex, presence: true, inclusion:    { in: sexes.keys }
  validates :size, presence: true, inclusion:   { in: sizes.keys }
  validates :animal, presence: true, inclusion: { in: animals.keys }
  validates :breed, presence: true, format:     { with: VALID_NAME_REGEX }
  validates :name, presence: true, format:      { with: VALID_NAME_REGEX }
  validates :bio, presence: true, length:       { minimum: 150, maximum: 1000 }
  validates :age, numericality: { only_integer: true, greater_than: 0, less_than: 30 }
end
