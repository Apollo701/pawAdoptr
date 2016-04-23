require 'rails_helper'

describe Pet do

  context "validating attributes" do
    it { should respond_to :species }
    it { should respond_to :sex }
    it { should respond_to :size }
    it { should respond_to :breed }
    it { should respond_to :name }
    it { should respond_to :bio }
    it { should respond_to :age }
    it { should respond_to :weight }
    it { should respond_to :fixed }
    it { should have_many(:users).through(:favorites) }
    it { should have_many(:favorites) }
  end

  describe "testing attributes of pets" do
    let(:pet){ FactoryGirl.build :pet }

    it "belongs to an invalid species" do
      expect{ pet.species = :lizard }.to raise_error(ArgumentError)
    end

    it "has invalid sex" do
      expect { pet.sex = :giraffe }.to raise_error(ArgumentError)
    end

    it "has invalid size" do
      expect { pet.size = :extraLarge }.to raise_error(ArgumentError)
    end

    context "has bio < 13 characters" do
      before { pet.bio = "a" * 12 }

      it { should_not be_valid }
    end

    context "has bio > 500 characters" do
      before { pet.bio = "a" * 501 }

      it { should_not be_valid }
    end

    context "it has a negative age" do
      before { pet.age = -1 }

      it { should_not be_valid }
    end

    context "it is 193 months old" do
      before { pet.age = 193 }

      it { should_not be_valid }
    end

    context "it has decimal age" do
      before { pet.age = 1.2 }

      it { should_not be_valid }
    end

    context "it has negative weight" do
      before { pet.weight = -5 }

      it { should_not be_valid }
    end

    context "it has decimal weight" do
      before { pet.weight = 1.2 }

      it { should_not be_valid }
    end

    context "it has invalid weight" do
      before { pet.weight = 131 }

      it { should_not be_valid }
    end

    it "is invalid fixed" do
      expect { pet.fixed = :nope }.to raise_error(ArgumentError)
    end
  end
end
