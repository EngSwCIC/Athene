@cadastro
Feature: Sistema de Cadastro
	Como usuário não autenticado, desejo me autenticar para que eu possa acessar a plataforma e postar comentários ou seguir outros assinantes

Scenario: Cadastro Efetuado com sucesso
	Given eu esteja na pagina de cadastro
	When eu preencho o formulario de cadastro com:
	|user[nick] | teste           |
	|user[senha]| teste12345      |
	|user[email]| teste@gmail.com |
	And clicando em "Registrar"
	Then eu receberei uma mensagem da pagina de cadastro "Usuario Cadastrado com Sucesso!"