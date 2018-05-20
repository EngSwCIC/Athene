require 'rails_helper'

RSpec.describe "users/index", type: :view do
  before(:each) do
    assign(:users, [
      User.create!( nick: "asdwnd", senha:"teste123897", email: "asndje@gmail.com" ),
      User.create!( nick: "borrows", senha:"testando123567", email: "dneofjoje@gmail.com")
    ])
  end

  it "renders a list of users" do
    render
  end
end
