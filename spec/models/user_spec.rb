require 'rails_helper'

describe User, type: :model do

  it "is valid with valid email" do
    user = User.new(email: "example@example.com")

    expect(user).to be_valid
  end

  it "is invalid if emails is blank" do
    user = User.new(email: "   ")

    expect(user).to be_invalid
  end

  it "is invalid if email is > 255 characters" do
    user = User.new(email: "a" * 256)

    expect(user).to be_invalid
  end

  it "is invalid if email already exists" do
    user = User.create(email: "example@example.com")
    dup_user = user.dup
    dup_user.email = dup_user.email.upcase
    expect(dup_user).to be_invalid
  end

  describe "with different emails" do
    before :each do
      @valid_emails = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]

      @invalid_emails = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    end

    context "with valid emails" do
      it "is a valid user" do
        @valid_emails.each { |valid_email| expect(User.new(email: valid_email)).to be_valid }
      end
    end

    context "with invalid emails" do
      it "is not a valid user" do
        @invalid_emails.each { |invalid_email| expect(User.new(email: invalid_email)).to be_invalid }
      end
    end
  end

end