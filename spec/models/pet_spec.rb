require 'rails_helper'

describe Pet, type: :model do
  before :each do
    @pet = Pet.new(animal: :dog,
                   name: "John",
                   bio: "Lorem ipsum dolor sit amet, consectetur 
                   adipiscing elit. Sed scelerisque arcu quis fermentum 
                   tristique. Sed rutrum turpis eget varius volutpat. 
                   Nullam".squish)
  end

  describe "is a specific type of animal" do
    it "is valid as a dog" do
      @pet.animal = :dog

      expect(@pet.animal).to eq("dog")
    end

    it "is valid as a cat" do
      @pet.animal = :cat

      expect(@pet.animal).to eq("cat")
    end

    it "is invalid with no animal type" do
      @pet.animal = nil

      expect(@pet).to be_invalid
    end
  end

  it "is invalid with no name" do
    @pet.name = " " * 6

    expect(@pet).to be_invalid
  end

  it "is invalid with numerical name" do
    @pet.name = 1245

    expect(@pet).to be_invalid
  end

  it "is invalid with symbols in name" do
    @pet.name = "John$"

    expect(@pet).to be_invalid
  end

  it "is invalid with a space in the name" do
    @pet.name = "John Doe"

    expect(@pet).to be_invalid
  end

  it "is invalid with no bio" do
    @pet.bio = ""

    expect(@pet).to be_invalid
  end

  it "is invalid with bio < 150 characters" do
    @pet.bio = "Lorem ipsum dolor sit amet, consectetur 
                   adipiscing elit. Sed scelerisque arcu quis fermentum 
                   tristique. Sed rutrum turpis eget varius volutpat.".squish
    expect(@pet).to be_invalid                   
  end

  it "has a breed"
  it "is male or female"
  it "has a valid age"
  it "is small, medium, or large"
  it "has valid weight"
  it "is neutered or spayed"
end
