require 'rails_helper'

describe User, type: :model do
  before :each do
    @user = User.new(email: "example@example.com", password: "foobar", password_confirmation: "foobar")
  end

  it "is invalid if email is blank" do
    @user.email = "     "

    expect(@user).to be_invalid
  end

  it "is invalid if email is > 255 characters" do
    @user.email = "a" * 256

    expect(@user).to be_invalid
  end

  it "is invalid if email already exists" do
    @user.save
    dup_user = @user.dup
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
        @valid_emails.each do |valid_email|
          @user.email = valid_email
          expect(@user).to be_valid
        end
      end
    end

    context "with invalid emails" do
      it "is not a valid user" do
        @invalid_emails.each do |invalid_email|
          @user.email = invalid_email
          expect(@user).to be_invalid
        end
      end
    end
  end

  it "is invalid with no password" do
    @user.password = @user.password_confirmation = " " * 6
    expect(@user).to be_invalid
  end

  it "is invalid with 5 character password" do
    @user.password = @user.password_confirmation = "a" * 5
    expect(@user).to be_invalid
  end

end