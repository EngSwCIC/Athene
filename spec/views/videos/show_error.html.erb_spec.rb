require 'rails_helper'

RSpec.describe "videos/show_error", type: :view do
  it "renderiza pagina de erro do video" do
    render
    expect(rendered).to match(/Video indefinido/)
  end
end
