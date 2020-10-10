require 'rails_helper'

RSpec.describe "Projects", type: :request do

  describe "GET /new" do
    it "returns http success" do
      get "/projects/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /create" do
    it "returns http success" do
      post "/projects"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/projects/edit"
      expect(response).to have_http_status(:success)
    end
  end

  describe "PATCH /update" do
    it "returns http success" do
      patch "/projects/update"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /index" do
    it "returns http success" do
      get "/projects/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/projects/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "DESTROY /destroy" do
    it "returns http success" do
      delete "/projects/:id"
      expect(response).to have_http_status(:success)
    end
  end

end
