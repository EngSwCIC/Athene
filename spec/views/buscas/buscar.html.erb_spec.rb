require 'rails_helper'

RSpec.describe "busca/buscar.html.erb", type: :view do
  it "renderiza a pagina de busca com videos" do
    render :template => "busca/buscar.html.erb"
    expect(rendered).to have_content "Busca por"
    expect(rendered).to have_content "Video"
    expect(rendered).to have_content "Canal"
    expect(rendered).to_not have_content "Nenhum video encontrado"
  end

  it "renderiza a pagina de busca sem videos" do
    render :template => "busca/buscar.html.erb"
    expect(rendered).to have_content "Busca por"
    expect(rendered).to have_content "Video"
    expect(rendered).to have_content "Canal"
    expect(rendered).to have_content "Nenhum video encontrado"
  end
end
