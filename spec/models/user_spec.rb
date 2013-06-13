require 'spec_helper'

describe User do
  it "doesn't allow user to be saved if first name is not provided" do
    user = User.new
    user.last_name = "blah"
    user.email = "foo@blah.com"
    user.save
    expect(User.all.count).to eql(0)
  end

  it "doesn't allow user to be saved if first name is not provided" do
    user = User.new
    user.first_name = "blah"
    user.email = "foo@blah.com"
    user.save
    expect(User.all.count).to eql(0)
  end

  it "doesn't allow user to be saved if first name is not provided" do
    user = User.new
    user.last_name = "blah"
    user.first_name = "blah"
    user.save
    expect(User.all.count).to eql(0)
  end
end
