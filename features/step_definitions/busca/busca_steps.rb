
Given("eu tenho um video com nome {string}") do |string|
  @video = Video.new(title: string, description: string)
  @video.arq_video = Rails.root + "features/videos/teste.mp4"
  @video.valid = "teste.mp4"
  @video.file_path = Rails.root + "features/videos/teste.mp4"
  @video.user = -1
  @video.save!
  
end

When("preencher o formulario de busca com: {string}") do |string|
  #visit "/"
  fill_in('titulo', :with => string)
end

When("clicar no botao {string}") do |string|
  click_button string
  #expect(page).to have_selector string
  #expect(page).to have_css('Puscaa')
end

Then("eu serei redirecionado para a pagina busca com resultados e nao a mensagem {string}") do |string|
  expect(page).to_not have_content(string)
  #expect(page).to have_content(string)
  #banana = string
  @video.destroy
end

Given("eu esteja em uma pagina qualquer") do
  visit("/")
end

Then("eu serei redirecionado para a pagina busca com nenhum resultado e a mensagem {string}") do |string|
  expect(page).to have_content(string)
end
