require 'rails_helper'

RSpec.describe "users/show", type: :view do
  before(:each) do
    @user = assign(:user, User.create!( nick: "asdfg", senha:"teste12345", email: "asdfg@gmail.com" ))
  end

  it "renders attributes in <p>" do
    render
  end
end
