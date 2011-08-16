require 'spec_helper'

describe Event do

  it "should create a new instance given valid attributes" do
    Factory(:event)
  end

  it "should require a start date" do
    FactoryGirl.build(:event, :start_date => nil).should_not be_valid
  end

  it "should require a valid user_id" do
    FactoryGirl.build(:event, :user => nil).should_not be_valid
  end

  it "should have coordinates after creation" do
    event = FactoryGirl.create(:event)
    event.should respond_to(:coordinates)
  end

  it "should require a name" do
    FactoryGirl.build(:event, :name => nil).should_not be_valid
  end

  describe "address" do

    it "should require a valid address" do
      event = FactoryGirl.build(:event)
      event.address = FactoryGirl.build(:address, :street => nil)
      event.should_not be_valid
    end

  end

end
