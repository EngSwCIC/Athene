class AutenticacaoController < ApplicationController
	def login
		if params[:Acesso] == 'Logar'
			verificar_database params[:nome], params[:password]
		end
	end

	private
	def verificar_database nick, senha
		if User.exists?(nick)
			user = User.find(nick)
			if user.senha != senha
				@message = "senha invalida"
			end
			@message = "login feito com sucesso!"
		else
			@message = "Erro Usuario Inexistente"
		end
	end
end
