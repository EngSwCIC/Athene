require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /users" do
    it "carrega pagina correta de usuarios" do
      get users_path
      expect(response).to have_http_status(200)
    end
  end
end
