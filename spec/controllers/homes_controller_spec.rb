require 'rails_helper'

RSpec.describe HomesController, type: :controller do

  describe "GET #calendar" do
    it "returns http found" do
      get :calendar
      expect(response).to have_http_status(:found)
    end
  end
  
end
