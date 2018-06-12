require 'rails_helper'

RSpec.describe AutenticacaoController, type: :controller do
	let(:valid_attributes) { 
		{ nick:"testesk", senha:"teste123", email:"teste@gmail.com" } 
	}

	let(:valid_argments) {
	    { nick:"testesk", senha:"teste123", email:"teste@gmail.com", controller:'autenticacao',action:'login'  }	
	}

	let(:invalid_attributes){ 
		{ nick:"inexistente", senha:"inexistente", email:"nenhum@gamil.com" } 
	}

	let(:invalid_argments){
		{ nick:"inexistente", senha:"inexistente", email:"nenhum@gamil.com", controller:'autenticacao',action:'login' }
	}
	let(:valid_session) { {} }

	describe "GET #login" do
		it "acessa a pagina de login" do
			get :login, params: {}, session: valid_session
			expect(response).to render_template("login")
		end
	end

	describe "POST #login" do
        before(:each) do
           @user = User.new valid_attributes
        end

        after(:each) do
           @user.destroy
        end

        it "faz o login na pagina"  do
            post :login, params: valid_attributes , session: valid_session
            expect(controller.params).to eq ActionController::Parameters.new valid_argments
            expect(response).to be_success
        end

        it "nao faz o login pois o usuario nao existe" do
            post :login, params: invalid_attributes , session: valid_session
            expect(controller.params).to eq ActionController::Parameters.new invalid_argments
            expect(response).to be_success
        end
	end

end
