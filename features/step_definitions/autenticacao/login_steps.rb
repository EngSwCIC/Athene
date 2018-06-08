Given("eu esteja na pagina de login") do
  visit('/login')
  @user = User.find_by nick:'teste'
  if !@user.nil?
    @user.destroy
  end
  @user = User.new(nick:'teste', senha:'teste123456', email:'teste@gmail.com')
  @user.save!
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
  @user.destroy unless @user.nil?
end
