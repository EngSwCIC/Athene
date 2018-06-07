require 'rails_helper'

RSpec.describe "comments/_reply", type: :view do
  before(:each) do
    @video = Video.new(title: 'teste', description: 'teste')
    @video.arq_video = Rails.root + "features/videos/teste.mp4"
    @video.valid = "teste.mp4"
    @video.file_path = Rails.root + "features/videos/teste.mp4"
    @video.user = -1
    @video.save!
    @user = User.new(nick:'abcde',senha:'1234',email:'algo@hotmail.com')
    @user.save!
    @new_comment = Comment.build_from(@video, @user.id, "commit")
    @comments = Array.new
    @comments << @new_comment
  end

  after(:each) do
    @video.destroy unless @video.nil?
    @user.destroy unless @user.nil?
    @comments.clear
  end

  it "renderiza os comentarios e botões de reply da pagina" do
    render :template => "comments/_reply.html.erb", locals: { comments: @comments }
    expect(rendered).to have_css 'div', :class => 'comment'
    expect(rendered).to have_css 'div', :class => 'comment-nav'
    expect(rendered).to have_css 'div', :class => 'reply-form'
  end
end