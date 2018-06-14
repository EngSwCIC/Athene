Given("eu esteja na pagina de um vídeo {string} e esteja logado") do |teste|
	@video = Video.new(title: teste, description: teste)
	@video.arq_video = Rails.root + "features/videos/teste.mp4"
	@video.valid = "teste.mp4"
	@video.file_path = Rails.root + "features/videos/teste.mp4"
	@video.user = -1
	@video.save!
	@user = User.find_by nick: 'teste'
	if @user.nil?
		@user = User.new(nick: "teste", senha:"abc12345", email:"raulgil@gmail.com")
		@user.save!
	end
	page.driver.browser.set_cookie 'login=teste'
	@denunciar = Denunciar.build_from(@video, @user.id, "alguma coisa")
	@denunciar.user = @user
	@denunciar.save!
	visit("/videos?name_video=#{teste}")
end

Given("eu esteja na pagina de um vídeo {string} para denunciar") do |teste|
	@video = Video.new(title: teste, description: teste)
	@video.arq_video = Rails.root + "features/videos/teste.mp4"
	@video.valid = "teste.mp4"
	@video.file_path = Rails.root + "features/videos/teste.mp4"
	@video.user = -1
	@video.save!
	@user = User.find_by nick: 'teste'
	if !@user.nil?
		@user.destroy
	end
	@user = User.new(nick: "teste", senha:"abc12345", email:"raulgil@gmail.com")
	@user.save!
	@denunciar = Denunciar.build_from(@video, @user.id, "alguma coisa")
	@denunciar.user = @user
	@denunciar.save!
	visit("/videos?name_video=#{teste}")
end

When("eu encontrar na página {string}") do |denunciar|
	expect(page).to have_content denunciar
end

When("quiser denunciar {string}") do |denunciar|
	fill_in 'denunciar', with: denunciar
end

When("clicar no link {string}") do |link|
	if link == 'denunciar'
		find('.denunciar',:text => link).click 
	else
		find('#tirardenuncia',:text => link).click
	end
end

Given("eu esteja na pagina de um vídeo {string} para tirar denuncia") do |denunciar|
	fill_in 'tirar Denuncia', with: Tirardenuncia
end

When("quiser tirar denuncia {string}") do |denunciar|
	expect(page).to have_content denunciar		
end

Then("eu não encontrarei o botão {string}") do |link|
	expect(page).not_to have_content link
end

Then("eu receberei esta mensagem {string} na pagina do video") do |link|
	expect(page).to have_css('.denunciar',:text => link)
end

