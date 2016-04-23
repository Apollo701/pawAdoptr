require 'rails_helper'

describe Favorite do
  describe "favorite.rb" do
    it { should belong_to(:user) }
    it { should belong_to(:pet) }
  end
end
