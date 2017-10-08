require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    User.create(name: 'paul', password: 'the_password', email: 'paul.godubs@dubs.com')
    @user = User.first
  end

  it "has many carts" do
    @user.carts.create
    expect(@user.carts.count).to eq(1)
  end

  it "has a current_cart" do
    @user.current_cart = @user.carts.create
    expect(@user.current_cart).to be_a(Cart)
  end

end
