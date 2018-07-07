def buildloginUser
  @user = User.find_by nick:'teste'
  if !@user.nil?
    @user.destroy
  end
  @user = User.new(nick:'teste', senha:'teste123456', email:'teste@gmail.com')
  @user.save!
end

def unbuildloginUser
  page.driver.browser.clear_cookies
  @user.destroy unless @user.nil?
end

Given("eu esteja na pagina de login") do
  visit('/login')
  buildloginUser
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

Given("eu esteja na pagina de login e esteja logado") do
  buildloginUser
  page.driver.browser.set_cookie "login=teste"
  visit('/login')
end

When("eu clicar no botao {string} em login") do |string|
  click_link('logout')
end

Then("irei deslogar da aplicacao") do
  expect(page).to_not have_content "logout"
  unbuildloginUser
end

