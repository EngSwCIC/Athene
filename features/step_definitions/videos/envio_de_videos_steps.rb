Given("eu esteja na pagina de upload de videos e esteja logado") do
  @user = User.new(nick: "teste", senha:"abc12345", email:"raulgil@gmail.com")
  @user.save!
  cookies[:login] = "teste"
  visit('/upload')
end

Given("eu esteja na pagina de upload de videos e não esteja logado") do
  page.driver.browser.clear_cookies
  visit('/upload')
end

When("eu preencher o formulario:") do |table|
  # table is a Cucumber::MultilineArgument::DataTable
  table.rows_hash.each do |field, value|
  	fill_in field, with: value
  end
end

When("selecionando o arquivo {string}") do |teste_video|
  @test_video = "#{teste_video}"
  page.attach_file 'arq_video', Rails.root + "features/videos/#{@test_video}"
end

When("clicando no botao {string}") do |teste_botao|
	click_button teste_botao
end

Then("eu receberei a mensagem {string}") do |mensagem|
	expect(page).to have_content mensagem
  if !@test_video.nil?
	 path = Rails.root+"public/uploads/defult/#{@test_video}"
	 File.delete path if File.exists?(path)
  end
  @user.destroy unless @user.nil?
  page.driver.browser.clear_cookies
end