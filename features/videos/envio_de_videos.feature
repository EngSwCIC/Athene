@envio
Feature: Envio de Videos
	Como um usuário da aplicação, desejo enviar vídeos para a plataforma para compartilhar uma mídia com outros usuários.

Scenario: Envio de video com Sucesso
	Given eu esteja na pagina de upload de videos
	When eu preencher o formulario:
	|video[title]      | Teste 			|
	|video[description]| testando video |
	And selecionando o arquivo "teste.mp4"
	And clicando no botao "Upload"
	Then eu receberei a mensagem "Upload feito com sucesso!"

Scenario: Envio de video com Falha no Titulo
	Given eu esteja na pagina de upload de videos
	When eu preencher o formulario:
	|video[title]      |    			|
	|video[description]| testando video |
	And selecionando o arquivo "teste.mp4"
	And clicando no botao "Upload"
	Then eu receberei a mensagem "Aba não preenchida"

Scenario: Envio de video com Falha sem arquivos
	Given eu esteja na pagina de upload de videos
	When eu preencher o formulario:
	|video[title]      |    Testando	|
	|video[description]| testando video |
	And clicando no botao "Upload"
	Then eu receberei a mensagem "Vídeo não selecionado!"

Scenario: Envio de video com Falha de extensão no arquivo
	Given eu esteja na pagina de upload de videos
	When eu preencher o formulario:
	|video[title]      |    Testando	|
	|video[description]| testando video |
	And selecionando o arquivo "teste_error.txt"
	And clicando no botao "Upload"
	Then eu receberei a mensagem "Formato Inválido!"
