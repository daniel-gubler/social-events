require 'spec_helper'

describe User do

  it "should create a new instance given a valid attribute" do
    FactoryGirl.create(:user)
  end

  it "should require an email address" do
    FactoryGirl.build(:user, :email => "").should_not be_valid
  end

  it "should accept valid email addresses" do
    addresses = %w[user@foo.com THE_USER@foo.bar.org first.last@foo.jp]
    addresses.each do |address|
      FactoryGirl.build(:user, :email => address).should be_valid
    end
  end

  it "should reject invalid email addresses" do
    addresses = %w[user@foo,com user_at_foo.org example.user@foo.]
    addresses.each do |address|
      FactoryGirl.build(:user, :email => address).should_not be_valid
    end
  end

  it "should reject email addresses identical up to case" do
    existing_user = FactoryGirl.create(:user)
    FactoryGirl.build(:user, :email => existing_user.email.upcase).
      should_not be_valid
  end

  describe "passwords" do

    before(:each) do
      @user = FactoryGirl.build(:user)
    end

    it "should have a password attribute" do
      @user.should respond_to(:password)
    end

    it "should have a password confirmation attribute" do
      @user.should respond_to(:password_confirmation)
    end

  end

  describe "password validations" do

    it "should require a password" do
      FactoryGirl.build(:user, :password => "", :password_confirmation => "").
        should_not be_valid
    end

    it "should require a matching password confirmation" do
      FactoryGirl.build(:user,:password_confirmation => "invalid").
        should_not be_valid
    end

    it "should reject short passwords" do
      short = "a" * 5
      FactoryGirl.build(:user,:password => short,:password_confirmation => short).
        should_not be_valid
    end

  end

  describe "password encryption" do

    before(:each) do
      @user = FactoryGirl.create(:user)
    end

    it "should have an encrypted password attribute" do
      @user.should respond_to(:encrypted_password)
    end

    it "should set the encrypted password attribute" do
      @user.encrypted_password.should_not be_blank
    end

  end

end
