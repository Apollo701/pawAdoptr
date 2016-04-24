require 'rails_helper'

describe "UsersSignups" do
  describe "failed signups" do

    it "shows error messages on failed signup" do
      get signup_path
      user_count = User.count
      post users_path,  user: {
                        email:          "apollo701",
                        password:             "foo",
                        password_confirmation: "bar"
      }
      expect(User.count).to eq(user_count)
      expect(response).to render_template(:new)
    end
  end

  describe "valid signup" do
    let(:user) { FactoryGirl.build :user }

    it "saves a valid user" do
      get signup_path
      expect{user.save}.to change{User.count}.from(0).to(1)
    end
  end
end
