require 'rails_helper'

RSpec.describe "Users::SessionsController", type: :request do

  describe "GET /new" do
    it "returns http success" do
      get "/users/login"
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /create" do
    it "returns http success" do
      post "/users/login"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      post "/users/login", params: { user: {email: "ethan_gustafson@outlook.com", password: "123456"} }
      get "/"
      expect(response).to have_http_status(:success)
    end
  end

  describe "DESTROY /destroy" do
    it "returns http success" do
      delete "/users/logout"
      expect(response).to have_http_status(:redirect)
    end
  end
  
end
