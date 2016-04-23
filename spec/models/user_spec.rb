require 'rails_helper'

describe User do
  describe "models/user.rb" do
    let(:user) { FactoryGirl.build :user }

    it { should respond_to :email }
    it { should respond_to :password }
    it { should respond_to :password_confirmation }
    it { should respond_to :password_digest }

    context "basic checks" do
      it "has an email" do
        expect(user.email).to eq("test@example.com")
      end

      it "has a password & password password confirmation" do
        expect(user.password).to eq("foobar")
        expect(user.password_confirmation).to eq("foobar")
      end

      it "can authenticate" do
        expect(!!user.authenticate('foobar')).to be true
      end

      it "saves emails as lowercase" do
        mixed_case_email = "ExAmPlE@ExAmPlE.CoM"
        user.email = mixed_case_email
        user.save
        expect(user.reload.email).to eq(mixed_case_email.downcase)
      end

      describe "duplicate user" do
        before do
          dup_user = user.dup
          dup_user.email = dup_user.email.upcase
          dup_user.save
        end

        it "is invalid if email already exists" do
          expect(user).to be_invalid
        end
      end

      describe "valid and invalid emails" do
        before :each do
        @valid_emails = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                           first.last@foo.jp alice+bob@baz.cn]

        @invalid_emails = %w[user@example,com user_at_foo.org user.name@example.
                             foo@bar_baz.com foo@bar+baz.com]
        end

        it "is has valid emails" do
          @valid_emails.each do |valid_email|
            user.email = valid_email
            expect(user).to be_valid
          end
        end

        it "is not a valid user" do
          @invalid_emails.each do |invalid_email|
            user.email = invalid_email
            expect(user).to be_invalid
          end
        end
      end
    end
  end
end
