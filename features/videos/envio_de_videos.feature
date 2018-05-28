@envio
Feature: Envio de Videos
	Como um usuário da aplicação, desejo enviar vídeos para a plataforma para compartilhar uma mídia com outros usuários.

Scenario: Envio de video com Sucesso
	Given eu esteja na pagina de upload de videos
	When eu preencher o formulario:
	|video[title]      | Teste 			|
	|video[description]| testando video |
	And selecionando o arquivo "teste"
	And clicando no botao "Upload"
	Then eu receberei a mensagem "Upload feito com sucesso!"