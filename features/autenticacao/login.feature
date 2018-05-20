@login
Feature: Sistema de Login
	Como usuário não autenticado, desejo me autenticar para que eu possa acessar a plataforma e postar comentários ou seguir outros assinantes

Scenario: Login nao foi efetuado com sucesso
	Given eu esteja na pagina de login
	When eu preencher o formulario de login com:
	|nome    |       |
	|password|       |
	And clicar em "Logar"
	Then eu receberei uma mensagem da pagina de login "Campos vazios"