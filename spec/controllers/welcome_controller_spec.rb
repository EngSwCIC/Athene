require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "index" do
    it "recebe videos" do
      expect(@videos).to_not be_empty
    end

    it "nao recebe videos" do
      expect(@videos).to be_empty
    end
  end

end
