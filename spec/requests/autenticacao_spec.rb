require 'rails_helper'

RSpec.describe "Autenticacao", type: :request do
	describe "GET /login" do
		it "carrega a pagina corretamente" do
			get '/login'
			expect(response).to have_http_status(200)
		end
	end
end