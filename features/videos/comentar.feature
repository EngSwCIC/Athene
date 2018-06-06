@comentar
Feature: Comentar
  Como usuário autenticado,para expressar minha opinião ou crítica a respeito de um conteúdo, quero comentar nos vídeos dentro da plataforma.

Scenario: Comentando Video logado
  Given eu esteja na pagina de um vídeo "teste" e esteja logado
  When eu encontrar na página "Comentários"
  And quiser comentar "alguma coisa"
  And clicar em "Comentar"
  Then eu receberei a mensagem "Comentário postado com Sucesso!"

Scenario: Comentando Video deslogado
  Given eu esteja na pagina de um vídeo "teste" para comentar
  When eu encontrar na página "Comentários"
  And quiser comentar "alguma coisa"
  And clicar em "Comentar"
  Then eu receberei a mensagem "É preciso estar logado para comentar"

Scenario: Respondendo Comentário logado
  Given eu esteja na pagina de um vídeo "teste" e esteja logado
  When eu encontrar na página "Comentários"
  And clicar no link "responder"
  And quiser responder "alguma coisa"
  And clicar em "Postar Resposta"
  Then eu receberei a mensagem "Comentário postado com Sucesso!"

Scenario: Respondendo Comentário deslogado
  Given eu esteja na pagina de um vídeo "teste" para comentar
  When eu encontrar na página "Comentários"
  And clicar no link "responder"
  Then eu receberei a mensagem "É necessario estar logado para que possa responder"

Scenario: Deletando Comentário logado
  Given eu esteja na pagina de um vídeo "teste" e esteja logado
  When eu encontrar na página "Comentários"
  And quiser deletar "alguma coisa"
  And clicar no link "deletar"
  Then eu receberei a mensagem "Comentário deletado com sucesso!"

Scenario: Deletando Comentário deslogado
  Given eu esteja na pagina de um vídeo "teste" para comentar
  When eu encontrar na página "Comentários"
  And quiser deletar "alguma coisa"
  Then eu não encontrarei o botão "deletar"