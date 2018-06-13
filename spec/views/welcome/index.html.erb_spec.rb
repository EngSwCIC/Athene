require 'rails_helper'

RSpec.describe "welcome/index.html.erb", type: :view do
  it "renderiza a pagina de index sem videos" do
    render :template => "welcome/index.html.erb"
    expect(rendered).to have_content "Athene, a mais poderosa plataforma livre de vídeos"
    expect(rendered).to have_content "modestidade é tudo"
    expect(rendered).to have_content "Últimos vídeos"
    expect(rendered).to have_content "Nenhum video encontrado"
  end

  it "renderiza a pagina de index com videos" do
    render :template => "welcome/index.html.erb"
    expect(rendered).to have_content "Athene, a mais poderosa plataforma livre de vídeos"
    expect(rendered).to have_content "modestidade é tudo"
    expect(rendered).to have_content "Últimos vídeos"
    expect(rendered).to_not have_content "Nenhum video encontrado"
  end

end
