require "rails_helper"

RSpec.describe AutenticacaoController, type: :routing do
	it "routes para #login" do
		expect(:get => "/login").to route_to("autenticacao#login")
	end
end