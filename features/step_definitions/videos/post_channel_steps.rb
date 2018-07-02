def builduser tester
  @user = User.new(nick:tester, senha:tester, email:"#{tester}@gmail.com")
  @user.save!
  page.driver.browser.set_cookie "login=#{tester}"
end

def sendvideo video,account = -1
  @video = Video.new(title: video, description: video)
  @video.arq_video = Rails.root + "features/videos/teste.mp4"
  @video.valid = "#{video}.mp4"
  @video.file_path = Rails.root + "features/videos/teste.mp4"
  @video.user = account
  @video.save!
end

def clearbuildtests
  @user.destroy unless @user.nil?
  @video.destroy unless @video.nil?
  page.driver.browser.clear_cookies
end

Given("eu esteja na página da minha conta") do
  builduser "teste"
  visit("/videos")
end

When("eu enviar um vídeo {string} logado a minha conta") do |video|
  sendvideo video, @user.id
end

When("ir para pagina do meu canal") do
  visit("/channel/#{@user.nick}")
end

Then("irei ver o vídeo {string} postado") do |video|
  expect(page).to have_content @user.nick
  expect(page).to have_content video
  clearbuildtests
end

Given("eu esteja na página de envio de videos deslogado") do
  visit("/upload")
end

When("eu enviar um vídeo {string} deslogado a plataforma") do |video|
  sendvideo video
end

When("tentar ir para a pagina do meu suposto canal") do
  visit("/channel/teste")
end

Then("irei ver a mensagem {string} na pagina do meu suposto canal") do |mensagem|
  expect(page).to have_content mensagem
  clearbuildtests
end

Given("eu esteja na página de envio de vídeos logado") do
  builduser "asdf343"
  visit("/upload")
end

When("eu ir para a página do meu canal") do
  visit("/channel/#{@user.nick}")
end

Then("eu não irei ver nenhum vídeo {string}") do |video|
  expect(page).to have_content @user.nick
  expect(page).to_not have_content video
  clearbuildtests
end