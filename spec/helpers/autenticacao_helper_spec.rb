require 'spec_helper'

RSpec.describe AutenticacaoHelper, type: :helper do
	describe '#sucess_message' do
		it "retorna um valor verdade caso o login seja bem sucedido" do
			expect(helper.sucess_message "login feito com sucesso!").to eq true
		end

		it "retorna um valor falso caso o login nao seja bem sucedido" do
			expect(helper.sucess_message "Campos vazios").to eq false
		end
	end
end