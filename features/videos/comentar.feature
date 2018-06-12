@comentar
Feature: Comentar
  Como usuário autenticado,para expressar minha opinião ou crítica a respeito de um conteúdo, quero comentar nos vídeos dentro da plataforma.

Scenario: Comentando Video deslogado
  Given eu esteja na pagina de um vídeo "teste"
  When eu encontrar na página "Comentários"
  And quiser comentar "alguma coisa"
  Then Eu receberei a mensagem "É preciso estar logado para comentar"

Scenario: Comentando Video logado
  Given eu esteja na pagina de um vídeo "teste"
  When eu encontrar na página "Comentários"
  And quiser comentar "alguma coisa"
  Then Eu receberei a mensagem "Comentário postado com Sucesso!"

Scenario: Respondendo Comentário logado
  Given eu esteja na pagina de um vídeo "teste"
  When eu encontrar na página "Comentários"
  And quiser responder "alguma coisa"
  Then Eu receberei a mensagem "É preciso estar logado para comentar"

Scenario: Respondendo Comentário deslogado
  Given eu esteja na pagina de um vídeo "teste"
  When eu encontrar na página "Comentários"
  And quiser responder "alguma coisa"
  Then Eu receberei a mensagem "É necessario estar logado para que possa responder, faça o seu login e responda este comentário"

Scenario: Deletando Comentário logado
  Given eu esteja na pagina de um vídeo "teste"
  When eu encontrar na página "Comentários"
  And quiser deletar "alguma coisa"
  Then Eu receberei a mensagem "Comentário deletado com sucesso!"

Scenario: Deletando Comentário deslogado
  Given eu esteja na pagina de um vídeo "teste"
  When eu encontrar na página "Comentários"
  And quiser deletar "alguma coisa"
  Then Eu não encontrarei o botão "deletar"