require 'rails_helper'

RSpec.describe "videos/edit", type: :view do
  before(:each) do
    assign(:video, Video.new(
      :title => "teste",
      :description => "teste",
      :file_path => "teste"
    ))
  end

  it "renders the edit video form" do
    render

    assert_select "form[action=?][method=?]", "", "post" do

      assert_select "input[name=?]", "title"

      assert_select "textarea[name=?]", "description"

      assert_select "input[id=?]", "upload"

      assert_select "input[id=?]", "submit_up"
    end
  end
end
