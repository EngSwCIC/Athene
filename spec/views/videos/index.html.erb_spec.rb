require 'rails_helper'

RSpec.describe "videos/index", type: :view do
  before(:each) do
    assign(:videos, [
      Video.create!(
        :title => "Title",
        :description => "MyText",
        :video_file => "Video File",
        :file_path => "File Path"
      ),
      Video.create!(
        :title => "Title",
        :description => "MyText",
        :video_file => "Video File",
        :file_path => "File Path"
      )
    ])
  end

  it "renders a list of videos" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Video File".to_s, :count => 2
    assert_select "tr>td", :text => "File Path".to_s, :count => 2
  end
end
