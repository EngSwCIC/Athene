Given("eu esteja na pagina de um vídeo {string} e esteja logado") do |teste|
  @video = Video.new(title: teste, description: teste)
  @video.arq_video = Rails.root + "features/videos/teste.mp4"
  @video.valid = "teste.mp4"
  @video.file_path = Rails.root + "features/videos/teste.mp4"
  @video.user = -1
  @video.save!
  @user = User.new(nick: "teste", senha:"abc12345", email:"raulgil@gmail.com")
  @user.save!
  page.driver.browser.set_cookie 'login=teste'
  @comentario = Comment.build_from(@video, @user.id, "alguma coisa")
  @comentario.user = @user
  @comentario.save!
  visit("/videos?name_video=#{teste}")
end

Given("eu esteja na pagina de um vídeo {string} para comentar") do |teste|
  @video = Video.new(title: teste, description: teste)
  @video.arq_video = Rails.root + "features/videos/teste.mp4"
  @video.valid = "teste.mp4"
  @video.file_path = Rails.root + "features/videos/teste.mp4"
  @video.user = -1
  @video.save!
  @user = User.new(nick: "teste", senha:"abc12345", email:"raulgil@gmail.com")
  @user.save!
  @comentario = Comment.build_from(@video, @user.id, "alguma coisa")
  @comentario.user = @user
  @comentario.save!
  visit("/videos?name_video=#{teste}")
end

When("eu encontrar na página {string}") do |comments|
  expect(page).to have_content comments
end

When("quiser comentar {string}") do |comment|
  fill_in 'commit', with: comment
end

When("quiser responder {string}") do |reply|
  fill_in 'answer', with: reply
end

When("clicar no link {string}") do |link|
  if link == 'responder'
    find('.comment-reply',:text => link).click 
  else
    find('#deletando',:text => link).click
  end
end

When("quiser deletar {string}") do |comment|
  expect(page).to have_content comment
end

Then("eu não encontrarei o botão {string}") do |link|
  expect(page).not_to have_content link
end

Then("eu receberei esta mensagem {string} na pagina do video") do |link|
  expect(page).to have_css('.reply-form',:text => link)
end
