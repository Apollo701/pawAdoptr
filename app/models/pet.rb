class Pet < ActiveRecord::Base
  VALID_NAME_REGEX = /\A[a-zA-Z]+\z/
  enum animal: [:dog, :cat]
  validates :name, presence: true, format: { with: VALID_NAME_REGEX }
  validates :animal, inclusion: { in: animals.keys }
end
