Given("eu esteja na pagina de um vídeo {string}") do |teste|
  if teste != ""
   @video = Video.new(title: teste, description: teste)
   @video.arq_video = Rails.root + "features/videos/teste.mp4"
   @video.valid = "teste.mp4"
   @video.file_path = Rails.root + "features/videos/teste.mp4"
   @video.user = -1
   @video.save
  end
  visit("/videos?name_video=#{teste}")  
end

When("eu encontrar o título {string} do video") do |video|
  expect(page).to have_content video
end

When("eu encontrar a descrição {string}") do |description|
  expect(page).to have_content description
end

Then("Eu verei o {string}") do |streaming|
  expect(page).to have_selector streaming
  @video.destroy unless @video.nil?
end

When("eu não encontrar o {string} na pagina") do |tag|
  expect(page).to_not have_selector tag
end

Then("Eu receberei a mensagem {string}") do |mensagem|
  expect(page).to have_content mensagem
end
