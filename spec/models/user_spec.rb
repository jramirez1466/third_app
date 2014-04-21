require 'spec_helper'

describe User do
  
  before { @user = User.new(name: "Example User", email: "user@example.com")}  
  
  subject{ @user }

it { should respond_to(:name) }
it { should respond_to(:email)}
it { should respond_to(:password_digest)}
it { should respond_to(:password)}
it { should respond_to(:password_confirmation)}

it { should be_valid }

describe "when name is not [resent" do
  before { @user.name = " "}
  it { should_not be_vlid }
 end

describe "when email is not present" do
  before { @user.email = " " }
  it { should_not be_valid }
 end

 describe "when name is long" do
   before { @user.name = "b" * 31 }
   it { should_not be_valid }
  end

  describe "when email format is invalid" do
    it "should be invalid" do
    	addresses = %w[user@foo,com user_at_foo.org example.use@foo.]
    	addresses.each do |invalid_address|
    		@user.email = invalid_address
    		@user.should_not be_valid
    	end
    end
  end

  describe "when email format is invalid" do
    it "should be valid" do
      addresses = %w[user@foo.com user@foo.jp example+me@foo.edu]
      addresses.each do |valid_address|
        @user.email = valid_address
        @user.should be_valid
    end
    end
  end

  describe "when email address is taken" do
   before do 
    user_with_same_email = @user.dup
    user_with_same_email.email = @user.email.upcase
    user_with_same_email.save
  end

    it { should_not be_valid }
  end
end

