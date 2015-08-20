require 'rails_helper'

RSpec.describe ProfilesController, type: :controller do

  describe "GET #all" do
    it "returns http success" do
      get :all
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #view" do
    it "returns http success" do
      get :view
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #avatar" do
    it "returns http success" do
      get :avatar
      expect(response).to have_http_status(:success)
    end
  end

end
