require 'rails_helper'

RSpec.describe VideosHelper, type: :helper do
  describe '#failed_message' do
    it "retorna um valor verdade caso o usuario comente deslogado" do
	   expect(helper.failed_message "É preciso estar logado para comentar").to eq true
	end

    it "retorna um valor falso caso usuario comente logado" do
      expect(helper.failed_message "sadsd").to eq false
	end
  end

  after(:context) do
    @user.destroy unless @user.nil?
  end

  describe '#comment_user?' do   
    it "retorna um valor falso caso o id nao bata com os parametros recebidos" do
	   expect(helper.comment_user? 0).to eq false
	end

	before(:context) do
	  @logon = "teste"
  	end

    it "retorna um valor falso caso o id do usuario nao seja encontrado" do
      expect(helper.comment_user? 0, @logon).to eq false
	end

	before(:context) do
      @user = User.find_by nick: @logon
      if @user.nil?
        @user = User.new(nick: @logon,senha: @logon, email: 'teste@gmail.com')
	  end
	end

    it "retorna um valor verdadeiro caso o id do usuario seja encontrado" do
      expect(helper.comment_user? @user.id, @logon).to eq true
	end
  end
end
