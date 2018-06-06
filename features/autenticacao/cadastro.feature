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

Scenario: Cadastro não efetuado possui campos vazios
	Given eu esteja na pagina de cadastro
	When eu preencho o formulario de cadastro com:
	|user[nick] |   |
	|user[senha]|   |
	|user[email]|   |
	And clicando em "Registrar"
	Then eu receberei uma mensagem da pagina de cadastro "aba não preenchida"

Scenario: Cadastro não efetuado usuário ja cadastrado
	Given eu esteja na pagina de cadastro e esteja cadastrado
	When eu preencho o formulario de cadastro com:
	|user[nick] | teste           |
	|user[senha]| teste           |
	|user[email]| teste@gmail.com |
	And clicando em "Registrar"
	Then eu receberei uma mensagem da pagina de cadastro "Nick Já cadastrado, utilize outro nick para cadastro"


Scenario: Cadastro não efetuado email inválido
	Given eu esteja na pagina de cadastro
	When eu preencho o formulario de cadastro com:
	|user[nick] | teste           |
	|user[senha]| teste           |
	|user[email]| testegmail      |
	And clicando em "Registrar"
	Then eu receberei uma mensagem da pagina de cadastro "Email formato inválido"