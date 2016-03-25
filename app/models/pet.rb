class Pet < ActiveRecord::Base
  VALID_NAME_REGEX = /\A[a-zA-Z\-.\s]+\z/
  enum species: [:dog, :cat]
  enum sex: [:male, :female]
  enum size: [:small, :medium, :large]
  enum fixed: [:neutered, :spayed]
  validates :sex, presence: true, inclusion:    { in: sexes.keys }
  validates :size, presence: true, inclusion:   { in: sizes.keys }
  validates :species, presence: true, inclusion: { in: species.keys }
  validates :breed, presence: true, format:     { with: VALID_NAME_REGEX }
  validates :name, presence: true, format:      { with: VALID_NAME_REGEX }
  validates :bio, presence: true, length:       { minimum: 150, maximum: 500 }
  # validates :age, presence: true, numericality: { only_integer: true, greater_than: 0, less_than: 30 }
  # validates :weight, presence: true, numericality: { only_integer: true, greater_than: 3, less_than: 130 }
end

# require 'spec_helper'

# describe User do

#   before do
#     @user = User.new(name: "Example User", email: "user@example.com")
#   end

#   subject { @user }

#   it { should respond_to(:name) }
#   it { should respond_to(:email) }

#   it { should be_valid }

#   describe "when name is not present" do
#     before { @user.name = " " }
#     it { should_not be_valid }
#   end
# end