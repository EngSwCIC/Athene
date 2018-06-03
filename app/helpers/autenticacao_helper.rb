module AutenticacaoHelper

	def sucess_message msg, check="login feito com sucesso!"
		return msg == check
	end
	
end