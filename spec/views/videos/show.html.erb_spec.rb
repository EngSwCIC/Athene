require 'rails_helper'

RSpec.describe "videos/show", type: :view do
  before(:each) do
    @video = assign(:video, Video.create!(
      :title => "Title",
      :description => "MyText",
      :video_file => "Video File",
      :file_path => "File Path"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Video File/)
    expect(rendered).to match(/File Path/)
  end
end
