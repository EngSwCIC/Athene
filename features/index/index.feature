@index
Feature: Página inicial
	Como usuário da plataforma (logado ou não), eu quero que exista uma página inicial para que eu possa receber recomendações de vídeos (novos ou populares) e logar ou me cadastrar no site.

Scenario: Página inicial carregou vídeos
	Given tem algum video no banco de dados
	When eu carregar a pagina
	Then haverao videos para ver

Scenario: Página inicial não carregou vídeos
	Given nao ha videos no banco de dados
	When eu carregar a pagina
	Then mostrara a mensagem: "Nenhum video encontrado"