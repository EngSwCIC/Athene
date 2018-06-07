require 'rails_helper'

RSpec.describe "comments/_template", type: :view do
  def setup
    @video = Video.new(title: 'teste', description: 'teste')
    @video.arq_video = Rails.root + "features/videos/teste.mp4"
    @video.valid = "teste.mp4"
    @video.file_path = Rails.root + "features/videos/teste.mp4"
    @video.user = -1
    @video.save!
    @user = User.new(nick:'abcde',senha:'1234',email:'algo@hotmail.com')
    @user.save!
    @new_comment = Comment.build_from(@video, @user.id, "commit")
    @comment = Comment.build_from(@video, @user.id, "commit")
  end

  def clear
    @video.destroy unless @video.nil?
    @user.destroy unless @user.nil?
    @new_comment.destroy unless @new_comment.nil?
    @comment.destroy unless @comment.nil?
  end

  it "renderiza o template de comentarios na pagina" do
    setup
    render :template => "comments/_template.html.erb", locals: {commentable: @video, new_comment: @comment}
    expect(rendered).to have_css 'div', :class => "comments-header"
    expect(rendered).to have_css 'div', :class => "comments-container"
    clear
  end
end