require 'rails_helper'

RSpec.describe "Documents", type: :request do
  describe "GET /new" do
    it "returns http success" do
      get "/documents/new"
      expect(response).to have_http_status(:success)
    end
  end

end
