require 'rails_helper'

RSpec.describe Comment, type: :model do
  before(:each) do
    @video = Video.new(title: 'teste', description: 'teste')
    @video.arq_video = Rails.root + "features/videos/teste.mp4"
    @video.valid = "teste.mp4"
    @video.file_path = Rails.root + "features/videos/teste.mp4"
    @video.user = -1
    @video.save!
    @user = User.new(nick:'abcde',senha:'1234',email:'algo@hotmail.com')
    @user.save!
  end

  after(:each) do
    @video.destroy unless @video.nil?
    @user.destroy unless @user.nil?
  end

  let(:valid_attributes) {
    { commentable: @video, user_id: @user.id, body:"Comentario",commentable_id:@video.id, commentable_type:'Video' }
  }

  let(:invalid_attributes) {
    { commentable: @video, body:"Comentario",commentable_id:@video.id, commentable_type:'Video' }
  }

  it "valido com os atributos válidos" do
    expect(Comment.new(valid_attributes)).to be_valid
  end

  it "invalido com os atributos inválidos" do
    expect(Comment.new(invalid_attributes)).to_not be_valid
  end
end