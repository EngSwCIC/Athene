Given("eu esteja na pagina de login") do
  visit('/login')
end

When("eu preencher o formulario de login com:") do |table|
  # table is a Cucumber::MultilineArgument::DataTable
  table.rows_hash.each do |field, value|
  	fill_in field, with: value
  end
end

When("clicar em {string}") do |botao|
	click_button botao
end

Then("eu receberei uma mensagem da pagina de login {string}") do |msg|
  expect(page).to have_content msg
end
