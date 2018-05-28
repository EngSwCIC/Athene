Given("eu esteja na pagina de upload de videos") do
  visit('/upload')
end

When("eu preencher o formulario:") do |table|
  # table is a Cucumber::MultilineArgument::DataTable
  table.rows_hash.each do |field, value|
  	fill_in field, with: value
  end
end

When("selecionando o arquivo {string}") do |teste_video|
  @test_video = "#{teste_video}.mp4"
  page.attach_file 'arq_video', Rails.root + "features/videos/#{@test_video}"
end

When("clicando no botao {string}") do |teste_botao|
	click_button teste_botao
end

Then("eu receberei a mensagem {string}") do |mensagem|
	expect(page).to have_content mensagem
	path = Rails.root+"public/uploads/#{@test_video}"
	File.delete path if File.exists?(path)
end