require 'rails_helper'

describe Pet, type: :model do
  describe "is a specific type of animal" do
    it "is a dog" do
      dog = Pet.new(animal: :dog)
      
      expect(dog.animal).to eq("dog")
    end

    it "is a cat" do
      cat = Pet.new(animal: :cat)

      expect(cat.animal).to eq("cat")
    end

    it "is invalid with name and no animal type" do
      pet = Pet.new(name: "John")

      expect(pet).to be_invalid
    end
  end

  it "is invalid with animal type and no name" do
    pet = Pet.new(animal: :dog)

    expect(pet).to be_invalid
  end

  it "is valid with valid name and animal type" do
    pet = Pet.new(animal: :cat, name: "John doe")

    expect(pet).to be_valid
  end

  it "is invalid with numerical name" do
    pet = Pet.new(name: 1245)

    expect(pet).to be_invalid
  end

  it "is invalid with symbols in name" do
    pet = Pet.new(animal: :dog, name: "John Do$")

    expect(pet).to be_invalid
  end

  it "is invalid with no bio" do
    pet = Pet.new(bio: "")

    expect(pet.bio).not_to be_empty
  end
  it "has a breed"
  it "is male or female"
  it "has a valid age"
  it "is small, medium, or large"
  it "has valid weight"
  it "is neutered or spayed"
end
