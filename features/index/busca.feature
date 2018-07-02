@busca
Feature: Busca de vídeos
	Como usuário do site, eu quero poder procurar vídeos postados por título (de maneira que o nome que eu busque não precise estar totalmente correto), para que eu possa assistí-los.

Scenario: Busca retorna algum resultado
	Given eu tenho um video com nome "sampley"
	And eu esteja em uma pagina qualquer
	When preencher o formulario de busca com: "sam"
	And clicar no botao "Pusca"
	Then eu serei redirecionado para a pagina busca com resultados e nao a mensagem "Nenhum video encontrado"

Scenario: Busca nao retorna nenhum resultado
	Given eu esteja em uma pagina qualquer
	When preencher o formulario de busca com: "amendoim"
	And clicar no botao "Pusca"
	Then eu serei redirecionado para a pagina busca com nenhum resultado e a mensagem "Nenhum video encontrado"