def build_testvideo video
  teste = video
  @video = Video.new(title: teste, description: teste)
  @video.arq_video = Rails.root + "features/videos/teste.mp4"
  @video.valid = "teste.mp4"
  @video.file_path = Rails.root + "features/videos/teste.mp4"
  @video.user = -1
  @video.save
end

Given("eu esteja na página de um vídeo") do
  build_testvideo "teste"
  visit("/videos?name_video=teste")
end

When("eu ver um vídeo recomendado") do
  build_testvideo 'teste24'
  visit("/videos?name_video=teste")
  expect(page).to have_content 'teste24'
end

Then("eu poderei assistí-lo quando quiser") do
  find_link('teste24').visible?
end

When("eu estiver na aba de {string}") do |string|
  expect(page).to have_content string
end

Then("eu não verei nenhum video recomendado") do
  expect(page).to_not have_content 'teste24'
end
