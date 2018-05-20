require 'spec_helper'

RSpec.describe "autenticacao/_login_form.html.erb", type: :view do 
	it "renderiza o formulario de login" do
		render :template => "autenticacao/_login_form.html.erb"
		expect(rendered).to have_content "Nickname:"
		expect(rendered).to have_content "Senha:"
		expect(rendered).to have_selector "input[type=submit][value='Logar']"
	end
end