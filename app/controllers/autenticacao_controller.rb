class AutenticacaoController < ApplicationController
	def login
		if params[:Acesso] == 'Logar' #verifica se o formulario foi enviado
			verificar_database params[:nome], params[:password] #caso seja verifica no banco se existe o usuario
		end
	end

	def logout #logout caso o usuario deseje sair
		cookies.delete :login
		redirect_to '/login'
	end

	private
	def verificar_database nome, senha
		if User.exists?(nick: nome,senha: senha) #se existir o login sera bem sucedido
			@message = "login feito com sucesso!"
			cookies[:login] = nome #armazena o nome do usuario em um cookie para identificar se esta logado ou nao
		else
			@message = "Erro Usuario Inexistente" #o login nao sera bem sucedido caso contrario
		end
	end
end
