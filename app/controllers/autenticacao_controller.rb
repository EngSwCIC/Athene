class AutenticacaoController < ApplicationController
	def login
		if params[:Acesso] == 'Logar' #verifica se o formulario foi enviado
			verificar_database params[:nome], params[:password] #caso seja verifica no banco se existe o usuario
		end
		if !params[:notice].nil?
			@message = params[:notice]
			@check = @message
		end
	end

	def stream_test
	end

	def logout #logout caso o usuario deseje sair
		cookies.delete :login
		redirect_to '/login'
	end

	private
	def verificar_database nome, senha
		@check = "login feito com sucesso!"
		if nome == "" || senha == "" #valida se os campos estão preenchidos corretamente
			if nome == "" && senha == ""
				@message = "Campos vazios"
			elsif nome == ""
				@message = "Nickname não preenchido"
			else
				@message = "Senha não preenchida"
			end
		elsif User.exists?(nick: nome,senha: senha) #se existir o login sera bem sucedido
			@message = @check
			cookies[:login] = nome #armazena o nome do usuario em um cookie para identificar se esta logado ou nao
		else
			@message = "Erro Usuario Inexistente" #o login nao sera bem sucedido caso contrario
		end
	end
end
