require 'rails_helper'

RSpec.describe User, type: :model do
  it "fails if emails is blank" do
    user = User.new(email: "   ")

    expect(user.valid?).to be_falsey
  end
end
