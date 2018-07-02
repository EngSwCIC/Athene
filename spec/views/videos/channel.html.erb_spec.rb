require 'rails_helper'

RSpec.describe "videos/channel", type: :view do
  def builduser tester
    @user = User.new(nick:tester, senha:tester, email:"#{tester}@gmail.com")
    @user.save!
  end

  def clearbuildtests
    @user.destroy unless @user.nil?
  end

  before(:each) do
    builduser "asdf1234"
  end

  after(:each) do
  	clearbuildtests
  end

  it "renderiza a pagina do canal" do
    render
    expect(rendered).to have_content @user.nick
    expect(rendered).to match(/asdf1234/)
  end

end