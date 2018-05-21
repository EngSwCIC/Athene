Given("eu esteja na pagina de cadastro") do
  visit('/registrar')
end

When("eu preencho o formulario de cadastro com:") do |table|
  # table is a Cucumber::MultilineArgument::DataTable
  table.rows_hash.each do |field, value|
  	fill_in field, with: value
  end
end

When("clicando em {string}") do |botao|
	click_button botao
end

Then("eu receberei uma mensagem da pagina de cadastro {string}") do |mensagem|
	expect(page).to have_content mensagem  
end
