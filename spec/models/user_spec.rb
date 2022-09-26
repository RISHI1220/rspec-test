require 'rails_helper'

RSpec.describe User, type: :model do
  context "validation tests" do
    it "ensure first name presence" do
      user = User.new(lastName: 'Last', email:'sample@example.com').save
      expect(user).to eq(false) 
    end
    it "ensure last name presence" do
      user = User.new(firstName: 'First', email:'sample@example.com').save
      expect(user).to eq(false)
    end
    it "ensure email presence" do
      user = User.new(firstName: 'First', lastName: 'Last').save
      expect(user).to eq(false)
    end
    it "should save successfully" do
      user = User.new(firstName: 'First', lastName: 'Last', email:'sample@example.com').save
      expect(user).to eq(true)
    end
  end
  context "scope tests" do
    let(:params) { {firstName: 'First', lastName: 'Last', email:'sample@example.com'} } 
    before(:each) do
      User.new(params).save
      User.new(params).save
      User.new(params.merge({active: true})).save
      User.new(params.merge({active: false})).save
      User.new(params.merge({active: false})).save
    end
    it "should return active users" do
      expect(User.active_users.size).to eq(3)  
    end
    it "should return inactive user" do
      expect(User.inactive_users.size).to eq(2)  
    end
  end
end
