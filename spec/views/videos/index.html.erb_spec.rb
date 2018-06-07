require 'rails_helper'

RSpec.describe "videos/index", type: :view do
  before(:each) do
    @caminho = "#{Rails.root}/public/uploads/temp"
    Dir.mkdir @caminho unless Dir.exists? @caminho
    @video = Video.new(title: 'teste', description: 'teste')
    @video.arq_video = "#{Rails.root}/features/videos/teste.mp4"
    @video.valid = "teste.mp4"
    @caminho = "#{@caminho}/#{@video.valid}"
    @video.file_path = @caminho
    @video.user = -1
    @video.save!
    @video.save!
    @videos = Video.all
  end

  after(:each) do
    @video.destroy unless @video.nil?
    @videos.each do |video|
      video.destroy
    end
    FileUtils.rm_rf @caminho
  end

  it "renders a list of videos" do
    render
    assert_select "tr>td", :text => "teste".to_s, :count => 2
    assert_select "tr>td", :text => "teste".to_s, :count => 2
    assert_select "tr>td", :text => @caminho.to_s, :count => 1
  end
end
