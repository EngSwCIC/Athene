require 'rails_helper'

RSpec.describe User, type: :model do
  let(:valid_attributes) {
    { nick: "asdfg", senha:"teste12345", email: "asdfg@gmail.com" }
  }

  let(:invalid_attributes) {
    { nick: "", senha:"teste", email: "asdfge" }
  }

  it "validado com atributos validos" do
    expect(User.new(valid_attributes)).to be_valid
  end

  it "validado com atributos invalidos" do
  	expect(User.new(invalid_attributes)).to_not be_valid
  end
end