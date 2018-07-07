@post_channel
Feature: Postagem de Vídeos em Minha conta
  Como usuário autenticado, desejo postar videos em minha conta na plataforma para que outros usuários possam assistir meu conteúdo.

Scenario: Postagem de videos em uma conta existente
  Given eu esteja na página da minha conta
  When eu enviar um vídeo "teste" logado a minha conta
  And ir para pagina do meu canal
  Then irei ver o vídeo "teste" postado

Scenario: Postagem de videos sem uma conta existente
  Given eu esteja na página de envio de videos deslogado
  When eu enviar um vídeo "teste" deslogado a plataforma
  And tentar ir para a pagina do meu suposto canal
  Then irei ver a mensagem "" na pagina do meu suposto canal

Scenario: Conta sem nenhuma postagem de vídeo
  Given eu esteja na página de envio de vídeos logado
  When eu ir para a página do meu canal
  Then eu não irei ver nenhum vídeo "teste"