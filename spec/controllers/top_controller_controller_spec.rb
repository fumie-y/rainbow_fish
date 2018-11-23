require 'rails_helper'

RSpec.describe TopControllerController, type: :controller do

  describe "GET #inquiry" do
    it "returns http success" do
      get :inquiry
      expect(response).to have_http_status(:success)
    end
  end

end
