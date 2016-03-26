require 'rails_helper'

describe Pet do

  context "initial tests validating attributes" do
    it { should respond_to :species }
    it { should respond_to :sex }
    it { should respond_to :size }
    it { should respond_to :breed }
    it { should respond_to :name }
    it { should respond_to :bio }
    it { should respond_to :age }
    it { should respond_to :weight }
    it { should respond_to :fixed }
  end

  describe "testing attributes of pets" do
  before do
    @pet = Pet.new(species: :dog,
                   name: "John",
                   bio: "Lorem ipsum dolor sit amet, consectetur 
                   adipiscing elit. Sed scelerisque arcu quis fermentum 
                   tristique. Sed rutrum turpis eget varius volutpat. 
                   Nullam".squish,
                   breed: "Corgi",
                   sex: :male,
                   age: 10,
                   size: :small,
                   weight: 22,
                   fixed: :neutered)
  end

  subject { @pet } 

    it "belongs to an invalid species" do
      expect{ @pet.species = :lizard }.to raise_error(ArgumentError)
    end

    context "has nil species" do
      before { @pet.species = nil }
      it { should_not be_valid }
    end

    context "has no species" do
      before { @pet.species = "" }

      it { should_not be_valid }
    end

    context "has no name" do
      before { @pet.name = "" }

      it { should_not be_valid }
    end

    context "has nil name" do
      before { @pet.species = nil }

      it { should_not be_valid }
    end

    context "has numerical name" do
      before { @pet.name = 12345 }

      it { should_not be_valid }
    end

    context "has symbols name" do
      before { @pet.name = "$&^" }

      it { should_not be_valid }
    end

    context "has no sex" do
      before { @pet.sex = "" }

      it { should_not be_valid }
    end

    context "has nil sex" do
      before { @pet.sex = nil }

      it { should_not be_valid }
    end

    it "has invalid sex" do
      expect { @pet.sex = :giraffe }.to raise_error(ArgumentError)
    end

    context "has no size" do
      before { @pet.size = "" }

      it { should_not be_valid }
    end

    context "has nil size" do
      before { @pet.size = nil }

      it { should_not be_valid }
    end

    it "has invalid size" do
      expect { @pet.size = :extraLarge }.to raise_error(ArgumentError)
    end

    context "has no breed" do
      before { @pet.breed = "" }

      it { should_not be_valid }
    end

    context "has nil breed" do
      before { @pet.breed = "" }

      it { should_not be_valid }
    end

    context "has numerical breed" do
      before { @pet.breed = 12345 }

      it { should_not be_valid }
    end

    context "has symbols breed" do
      before { @pet.breed = "&^%" }

      it { should_not be_valid }
    end

    context "has no bio" do
      before { @pet.bio = "" }

      it { should_not be_valid }
    end

    context "has nil bio" do
      before { @pet.bio = nil }

      it { should_not be_valid }
    end

    context "has bio < 150 characters" do
      before { @pet.bio = "a" * 149 }

      it { should_not be_valid }
    end

    context "has bio > 500 characters" do
      before { @pet.bio = "a" * 501 }

      it { should_not be_valid }
    end

    context "it has a negative age" do
      before { @pet.age = -1 }

      it { should_not be_valid }
    end

    context "it is 193 months old" do
      before { @pet.age = 193 }

      it { should_not be_valid }
    end

    context "it has a string age" do
      before { @pet.age = "age" }

      it { should_not be_valid }
    end

    context "it has no age" do
      before { @pet.age = "" }

      it { should_not be_valid }
    end

    context "it has nil age" do
      before { @pet.age = nil }

      it { should_not be_valid }
    end

    context "it has decimal age" do
      before { @pet.age = 1.2 }

      it { should_not be_valid }
    end

    context "it has no weight" do
      before { @pet.weight = " " }

      it { should_not be_valid }
    end

    context "it has nil weight" do
      before { @pet.weight = nil }

      it { should_not be_valid }
    end

    context "it has string weight" do
      before { @pet.weight = "weight" }

      it { should_not be_valid }
    end

    context "it has negative weight" do
      before { @pet.weight = -5 }

      it { should_not be_valid }
    end

    context "it has decimal weight" do
      before { @pet.weight = 1.2 }

      it { should_not be_valid }
    end

    context "it has invalid weight" do
      before { @pet.weight = 131 }

      it { should_not be_valid }
    end
    
    context "is not fixed" do
      before { @pet.fixed = "" }

      it { should_not be_valid }
    end

    context "is nil fixed" do
      before { @pet.fixed = nil }

      it { should_not be_valid }
    end

    it "is invalid fixed" do
      expect { @pet.fixed = :nope }.to raise_error(ArgumentError)
    end
  end
end
