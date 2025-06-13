require 'rails_helper'

RSpec.describe "StringCalculators", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/string_calculators/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/string_calculators/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/string_calculators/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/string_calculators/show"
      expect(response).to have_http_status(:success)
    end
  end

end
