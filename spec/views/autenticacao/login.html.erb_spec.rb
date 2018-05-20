require 'spec_helper'

RSpec.describe "autenticacao/login", type: :view do 
	it "renderiza a pagina de login" do
		render :template => "autenticacao/login.html.erb"
		expect(rendered).to have_content "Login"
	end
end