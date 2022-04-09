require 'rails_helper'

RSpec.describe "BasketItems", type: :request do
  describe "GET /add" do
    it "returns http success" do
      get "/basket_items/add"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /remove" do
    it "returns http success" do
      get "/basket_items/remove"
      expect(response).to have_http_status(:success)
    end
  end

end
