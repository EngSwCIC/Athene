Given("tem algum video no banco de dados") do
  @video = Video.new(title: "teste", description: "teste")
  @video.arq_video = Rails.root + "features/videos/teste.mp4"
  @video.valid = "teste.mp4"
  @video.file_path = Rails.root + "features/videos/teste.mp4"
  @video.user = -1
  @video.save
end

When("eu carregar a pagina") do
  visit "/"
end

Then("haverao videos para ver") do
  expect(page).to_not have_content("Nenhum video encontrado")
  @video.destroy
end

Given("nao ha videos no banco de dados") do
  expect(Video.all).to be_empty
end

Then("mostrara a mensagem: {string}") do |string|
  expect(page).to have_content(string)
end
