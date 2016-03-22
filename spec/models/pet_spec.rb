require 'rails_helper'

describe Pet, type: :model do
  before :each do
    @pet = Pet.new(animal: :dog,
                   name: "John",
                   bio: "Lorem ipsum dolor sit amet, consectetur 
                   adipiscing elit. Sed scelerisque arcu quis fermentum 
                   tristique. Sed rutrum turpis eget varius volutpat. 
                   Nullam".squish,
                   breed: "Corgi",
                   sex: "male",
                   age: 10,
                   size: :small)
  end

  describe "is a specific type of animal" do
    it "is valid as a dog" do
      @pet.animal = :dog

      expect(@pet.animal).to eq("dog")
    end

    it "is a cat" do
      @pet.animal = :cat

      expect(@pet.animal).to eq("cat")
    end

    it "is valid as a cat" do
      @pet.animal = :cat

      expect(@pet).to_not be_invalid
    end

    it "is valid as a dog" do
      @pet.animal = :dog

      expect(@pet).to_not be_invalid
    end

    it "is invalid with no animal type" do
      @pet.animal = nil

      expect(@pet).to_not be_valid
    end
  end

  it "is invalid with no name" do
    @pet.name = " " * 6

    expect(@pet).to_not be_valid
  end

  it "is invalid with numerical name" do
    @pet.name = 1245

    expect(@pet).to_not be_valid
  end

  it "is invalid with symbols in name" do
    @pet.name = "j@hn"

    expect(@pet).to_not be_valid
  end

  it "is valid with a hyphen in the name" do
    @pet.name = "gluteus-maximus"

    expect(@pet).to_not be_invalid
  end

  it "is valid with a space and period in name" do
    @pet.name = "dr. Evil"

    expect(@pet).to_not be_invalid
  end

  it "is invalid with no bio" do
    @pet.bio = ""

    expect(@pet).to_not be_valid
  end

  it "is invalid with bio < 150 characters" do
    @pet.bio = "Lorem ipsum dolor sit amet, consectetur 
                   adipiscing elit. Sed scelerisque arcu quis fermentum 
                   tristique. Sed rutrum turpis eget varius volutpat.".squish
    expect(@pet).to_not be_valid                   
  end

  it "is invalid with bio > 1000 characters" do
    @pet.bio = "a" * 1001

    expect(@pet).to_not be_valid
  end

  it "is invalid with no breed" do
    @pet.breed = nil

    expect(@pet).to_not be_valid
  end

  it "is invalid if the breed has symbols" do
    @pet.breed = "$%@Corgi"

    expect(@pet).to_not be_valid
  end

  it "is invalid if it has no sex" do
    @pet.sex = nil

    expect(@pet).to_not be_valid
  end

  it "is valid if it is a male" do
    @pet.sex = :male

    expect(@pet).to_not be_invalid
  end

  it "is valid if it is a female" do
    @pet.sex = :female

    expect(@pet).to_not be_invalid
  end

  it "is invalid with an char age" do
    @pet.age = "a"

    expect(@pet).to_not be_valid
  end

  it "is valid with age > 0 and age < 30" do
    @pet.age = 15

    expect(@pet).to_not be_invalid 
  end

  it "is invalid with age 0" do
    @pet.age = 0

    expect(@pet).to_not be_valid
  end

  it "is invalid with age of 30" do
    @pet.age = 30

    expect(@pet).to_not be_valid
  end

  it "is invalid without a size" do
    @pet.size = nil

    expect(@pet).to_not be_valid
  end

  it "is a small pet" do
    @pet.size = :small

    expect(@pet.size).to eq("small")
  end

  it "is a medium pet" do
    @pet.size = :medium

    expect(@pet.size).to eq("medium")
  end

  it "is a large pet" do
    @pet.size = :large

    expect(@pet.size).to eq("large")
  end

  it "is valid with a small size" do
    @pet.size = :small

    expect(@pet).to_not be_invalid
  end

  it "is valid with a medium size" do
    @pet.size = :medium

    expect(@pet).to_not be_invalid
  end

  it "is valid with a large size" do
    @pet.size = :large

    expect(@pet).to_not be_invalid
  end

  it "has valid weight"
  it "is neutered or spayed"
end
