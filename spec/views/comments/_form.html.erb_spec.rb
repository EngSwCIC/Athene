require 'rails_helper'

RSpec.describe "comments/_form", type: :view do
  def setup
    @video = Video.new(title: 'teste', description: 'teste')
    @video.arq_video = Rails.root + "features/videos/teste.mp4"
    @video.valid = "teste.mp4"
    @video.file_path = Rails.root + "features/videos/teste.mp4"
    @video.user = -1
    @video.save!
    @new_comment = Comment.build_from(@video, @video.id, "commit")
  end

  def clear
    @video.destroy unless @video.nil?
    @new_comment.destroy unless @new_comment.nil?
  end
  
  it "renderiza o formulario de comentario" do
    setup
    render :template => "comments/_form.html.erb"
    expect(rendered).to have_css "div", :class => 'field form-group'
    expect(rendered).to have_selector "input[type=submit][value='Comentar']"
    clear
  end
end