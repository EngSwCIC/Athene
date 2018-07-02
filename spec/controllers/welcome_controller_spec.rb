require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do

  let(:valid_attributes) {
    {title: 'tst', description: 'tst', user: 0, arq_video: "#{Rails.root}/features/videos/teste.mp4", valid:"test.mp4"}
  }

  let(:invalid_attributes) {
    {title: '', user: -2, arq_video: "#{Rails.root}/features/videos/teste.png", valid:"test.png"}
  }

  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns http success" do
      #video = Video.create! valid_attributes
      get :index
      expect(response).to have_http_status(:success)
      #video.destroy
    end
  end
end
