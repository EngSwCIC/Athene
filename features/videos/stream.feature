@stream
Feature: Streaming de Vídeos
	Como usuário (autenticado ou não), para me entreter, desejo assistir vídeos na plataforma

Scenario: Video pode ser assistido caso exista na base de dados
	Given eu esteja na pagina de um vídeo "teste"
	When eu encontrar o título "teste" do video
	And eu encontrar a descrição "teste"
	Then Eu verei o "video"

#Scenario: Video nao pode ser assitido pois nao existe na base de dados
#	Given eu esteja na pagina de um vídeo ""
#	When eu não encontrar o "video" na pagina
#	Then Eu receberei a mensagem "Video indefinido"