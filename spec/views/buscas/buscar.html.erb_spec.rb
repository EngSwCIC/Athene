require 'rails_helper'

RSpec.describe "busca/buscar", type: :view do

  let(:valid_session) { {} }


  def criaVideo string
    @video = Video.new(title: string, description: string)
    @video.arq_video = Rails.root + "features/videos/teste.mp4"
    @video.valid = "teste.mp4"
    @video.file_path = Rails.root + "features/videos/teste.mp4"
    @video.user = -1
    @video.save!
  end

  def delVideo
    @video.destroy unless @video.nil?
  end

  it "renderiza a pagina de busca sem videos" do
    render :template => "busca/buscar.html.erb"
    expect(rendered).to have_content "Nenhum video encontrado"
  end

  before(:context) do
    criaVideo "tst"
  end

  after(:context) do
    delVideo
  end

  it "renderiza a pagina de busca com videos" do
    render :template => "busca/buscar.html.erb"
    #expect(rendered).to_not have_content "Nenhum video encontrado"
    #expect(rendered).to match(/tst/)
  end


end