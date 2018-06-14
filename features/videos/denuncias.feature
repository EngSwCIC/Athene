@denuncias
Feature: Denuncias
Como usuário autenticado quero poder denunciar um vídeo para exercer meus direitos sobre o conteúdo do vídeo postado, caso eu seja o autor desta obra to Denúncias.

Scenario: Denunciando Video logado
  Given eu esteja na pagina de um vídeo "teste" e esteja logado
  When eu encontrar na página "Denunciar"
  And quiser denunciar "alguma coisa"
  And clicar em "Denunciar"
  Then eu receberei a mensagem "Video denunciado com Sucesso!"

Scenario: Denunciando Video deslogado
  Given eu esteja na pagina de um vídeo "teste" para denunciar
  When eu encontrar na página "Denunciar"
  And quiser denunciar "alguma coisa"
  And clicar em "Denunciar"
  Then eu receberei a mensagem "É preciso estar logado para denunciar"

Scenario: Tirando denuncia logado
  Given eu esteja na pagina de um vídeo "teste" e esteja logado
  When eu encontrar na página "Denunciar"
  And clicar no link "Tirar denuncia"
  And quiser tirar a denuncia "alguma coisa"
  And clicar em "Denunciar"
  Then eu receberei a mensagem "Denuncia retirada com Sucesso!"

Scenario: Tirando denuncia deslogado
  Given eu esteja na pagina de um vídeo "teste" para tirar denuncia
  When eu encontrar na página "Denunciar"
  And clicar no link "Tirar denuncia"
  Then eu receberei a mensagem "É necessario estar logado para que possa retirar a denúncia!"