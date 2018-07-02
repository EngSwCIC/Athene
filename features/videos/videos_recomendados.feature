@videos_recomendados
Feature:Videos Recomendados
   Como usuário do site(autenticado ou não), quero receber recomendações de vídeos relacionados aos que eu assisto para que possa me entreter assistindo-os.

Scenario:Existem recomendações de videos para o usuário ver
   Given eu esteja na página de um vídeo
   When eu ver um vídeo recomendado
   Then eu poderei assistí-lo quando quiser

Scenario:Não existem recomendações de videos para o usuario ver
   Given eu esteja na página de um vídeo
   When eu estiver na aba de "Videos recomendados"
   Then eu não verei nenhum video recomendado