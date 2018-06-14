@comments

Feature: Comments
  As a logged in user, I want to write comments on videos to share my thoughts and opinion about the same video.


  Scenario: Commenting a video (happy path)
    Given that I am logged in the application
    And I am on an existing video page
    When I write a comment "this video is awesome! loved it"
    And I click "Comentar"
    Then I should receive the message "Comentário postado com Sucesso"

  Scenario: Answering a comment (happy path)
    Given that I am logged in the application
    And I am on an existing video page
    And the video already has a comment "funny comment here" written
    When I click "responder"
    And I write an answer "this is a reply to your silly comment"
    And I click "Postar Resposta"
    Then I should receive the message "Comentário postado com Sucesso"

  Scenario: Deleting an answer (happy path)
    Given that I am logged in the application
    And I am on an existing video page
    And the video already has a comment "funny comment here" written
    And the comment already has an answer "me, you and zoboomafoo" written
    When I click "deletar" answer
    Then I should receive the message "Comentário deletado com sucesso!"

  Scenario: Deleting a comment (happy path)
    Given that I am logged in the application
    And I am on an existing video page
    And the video already has a comment "funny comment here" written
    When I click "deletar"
    Then I should receive the message "Comentário deletado com sucesso!"

  Scenario: Commenting a video (sad path)
    Given that I am not logged in the application
    And I am on an existing video page
    When I write a comment "such a bad video, this should be banned"
    And I click "Comentar"
    Then I should receive the message "É preciso estar logado para comentar"

  Scenario: Answering a comment (sad path)
    Given that I am not logged in the application
    And I am on an existing video page
    And the video already has a comment "funny comment here" written
    When I click "responder"
    Then I should receive the message "É necessario estar logado para que possa responder, faça o seu login e responda este comentário"

  Scenario: Deleting an answer (sad path)
    Given that I am not logged in the application
    And I am on an existing video page
    And the video already has a comment "funny comment here" written
    And the comment has an answer "me, you and zoboomafoo"
    Then I should not find the "deletar" button

  Scenario: Deleting a comment (sad path)
    Given that I am not logged in the application
    And I am on an existing video page
    And the video already has a comment "funny comment here" written
    When I want to delete the comment
    Then I should not find the "deletar" button
