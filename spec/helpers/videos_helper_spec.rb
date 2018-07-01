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
        @user.save!
	    end
	  end

    after(:context) do
      @user.destroy unless @user.nil?
    end

    it "retorna um valor verdadeiro caso o id do usuario seja encontrado" do
      expect(helper.comment_user? @user.id, @logon).to eq true
	  end
  end

  describe "#user_video" do
    before(:context) do
      @user = User.new(nick: 'teste',senha: 'teste', email: 'teste@gmail.com')
      @user.save!
    end

    after(:context) do
      @user.destroy unless @user.nil?
    end

    it "retorna um usuario de um video caso exista na base de dados" do
      expect(helper.user_video @user.id ).to eq @user.nick
    end

    it "retorna um usuario anonimo caso o usuario não esteja cadastrado na base de dados" do
      expect(helper.user_video -1 ).to eq "Anonymous"
    end

    it "retorna um usuario anonimo caso o usuario não exista na base de dados" do
      expect(helper.user_video 2 ).to eq "Anonymous"
    end
  end

  describe "#token" do
     it "retorna um id do token feliz caso seja um token de sucesso!" do
        expect(helper.token "asdf").to eq 'good_token'
     end

     it "retorna um id de token triste caso seja um token falho!" do 
       expect(helper.token "É preciso estar logado para comentar").to eq 'bad_token'
     end
  end
end
