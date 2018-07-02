require 'rails_helper'

RSpec.describe BuscaController, type: :controller do

  let(:valid_attributes) {
    {title: 'tst', description: 'tst', user: 0, arq_video: "#{Rails.root}/features/videos/teste.mp4", valid:"test.mp4"}
  }

  let(:invalid_attributes) {
    {title: '', user: -2, arq_video: "#{Rails.root}/features/videos/teste.png", valid:"test.png"}
  }

  let(:valid_session) { {} }

  describe "GET #busca" do
    it "returns http success" do
      video = Video.create! valid_attributes
      get :buscar, params: {:titulo => "tst"}, session: valid_session
	  expect(response).to have_http_status(:success)
      video.destroy
	end

	it "returns http success" do
    get :buscar, params: {:titulo => ""}, session: valid_session
	  expect(response).to redirect_to("/")
	  #expect(response).to have_http_status(:success)
	end
  end
end
