@login
Feature: Sistema de Login
	Como usuário não autenticado, desejo me autenticar para que eu possa acessar a plataforma e postar comentários ou seguir outros assinantes

Scenario: Login foi efetuado com sucesso
	Given eu esteja na pagina de login
	When eu preencher o formulario de login com:
	|nome    |   teste          |
	|password|   teste123456    |
	And clicar em "Logar"
	Then eu receberei uma mensagem da pagina de login "login feito com sucesso!"

Scenario: Login nao foi efetuado com sucesso
	Given eu esteja na pagina de login
	When eu preencher o formulario de login com:
	|nome    |       |
	|password|       |
	And clicar em "Logar"
	Then eu receberei uma mensagem da pagina de login "Campos vazios"

Scenario: Login sem nick preenchido
	Given eu esteja na pagina de login
	When eu preencher o formulario de login com:
	|nome    |   teste    |
	|password|       |
	And clicar em "Logar"
	Then eu receberei uma mensagem da pagina de login "Senha não preenchida"	

Scenario: Login sem senha preenchida
	Given eu esteja na pagina de login
	When eu preencher o formulario de login com:
	|nome    |       |
	|password|   teste123456  |
	And clicar em "Logar"
	Then eu receberei uma mensagem da pagina de login "Nickname não preenchido"

Scenario: Login com usuario inexistente
	Given eu esteja na pagina de login
	When eu preencher o formulario de login com:
	|nome    |   teste420     |
	|password|   teste123456  |
	And clicar em "Logar"
	Then eu receberei uma mensagem da pagina de login "Erro Usuario Inexistente"		
