require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  def setup
    @video = Video.new(title: 'teste', description: 'teste')
    @video.arq_video = Rails.root + "features/videos/teste.mp4"
    @video.valid = "teste.mp4"
    @video.file_path = Rails.root + "features/videos/teste.mp4"
    @video.user = -1
    @video.save!
    @user = User.new(nick:'abcde',senha:'1234',email:'algo@hotmail.com')
    @user.save!
    cookies[:login] = @user.nick
    cookies[:return_to] = "videos/#{@video.id}"
  end

  def unsetup
    cookies.delete :login
  end

  def clear
    @video.destroy unless @video.nil?
    @user.destroy unless @user.nil?
  end
  
  let(:valid_attributes) {
    { commentable: @video, user_id: @user.id, body:"Comentario",commentable_id:@video.id, commentable_type:'Video' }
  }

  let(:invalid_attributes) {
    { commentable: @video, user_id: @user.id, body:"Comentario",commentable_id:@video.id, commentable_type:'Video' }
  }

  let (:valid_session) { {} }

  describe "POST #create" do
      context "parametros validos" do
        it "criar novo comentario" do
          setup
          expect {
            post :create, params: {comment: valid_attributes}, session: valid_session
          }.to change(Comment, :count).by(1)
          unsetup
          clear
        end
      end

      context "parametros invalidos" do
        it "retorna um feedback ao retornar a pagina do video" do
          setup
          unsetup
          post :create, params: {comment: invalid_attributes}, session: valid_session
          expect(response).to_not be_success
          clear
        end
      end
  end

  describe "DELETE #destroy" do
     it "destroi o comentario" do
      setup
      coment = Comment.create! valid_attributes
      expect {
        delete :destroy, params: {id: coment.to_param}, session: valid_session
      }.to change(Comment, :count).by(-1)
      clear
    end

    it "redireciona o usuario na pagina do video" do
      setup
      coment = Comment.create! valid_attributes
      delete :destroy, params: {id: coment.to_param}, session: valid_session
      expect(response).to redirect_to(cookies[:return_to])
      clear
    end
  end

end
