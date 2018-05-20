require 'rails_helper'

RSpec.describe AutenticacaoController, type: :controller do
	let(:valid_session) { {} }

	describe "GET #login" do
		it "acessa a pagina de login" do
			get :login, params: {}, session: valid_session
			expect(response).to render_template("login")
		end

		it "entra em uma pagina de login parametrizada sem nick e senha" do
			get :login, params: { nick:"",senha:"",Acesso:"Logar" }, session: valid_session
			expect(controller.params[:nick]).to eq ""
			expect(controller.params[:senha]).to eq ""
			expect(controller.params[:Acesso]).to eq "Logar"
		end

		it "entra em uma pagina de login parametrizada com nick e sem senha" do
			get :login, params: { nick:"asdfg",senha:"",Acesso:"Logar" }, session: valid_session
			expect(controller.params[:nick]).to eq "asdfg"
			expect(controller.params[:senha]).to eq ""
			expect(controller.params[:Acesso]).to eq "Logar"
		end

		it "entra em uma pagina de login parametrizada sem nick e com senha" do
			get :login, params: { nick:"",senha:"hufbybendm",Acesso:"Logar" }, session: valid_session
			expect(controller.params[:nick]).to eq ""
			expect(controller.params[:senha]).to eq "hufbybendm"
			expect(controller.params[:Acesso]).to eq "Logar"
		end
	end

end
