require 'rails_helper'

RSpec.describe "videos/show", type: :view do
  before(:each) do
    @video = Video.new(title: 'teste', description: 'teste')
    @video.arq_video = Rails.root + "features/videos/teste.mp4"
    @video.valid = "teste.mp4"
    @video.file_path = Rails.root + "features/videos/teste.mp4"
    @video.user = -1
    @video.save!
    @new_comment = Comment.build_from(@video, @video.id, "")
  end

  after(:each) do
    @video.destroy unless @video.nil?
    @new_comment.destroy unless @new_comment.nil?
  end

  it "renderiza pagina do video" do
    render
    expect(rendered).to have_css "h2#recomendados"
    expect(rendered).to have_selector "video"
    expect(rendered).to have_content @video.title
    expect(rendered).to have_content @video.description
    expect(rendered).to match(/teste/)
    expect(rendered).to match(/teste/)
    expect(rendered).to match(/Videos recomendados/)
    expect(rendered).to match(/Comentários/)
  end
end
