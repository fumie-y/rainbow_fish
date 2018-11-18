require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe 'GET #index' do
    it 'returns status code 200'  do
      get :index
      expect(response.code).to eq '200'
    end
    it 'returns users' do
      users = create(:user)
      get :index
      expect(assigns(:users)).to match_array(users)
    end
  end
end

# describe "GET #new" do
#     it "returns http success" do
#       get :new
#       expect(response).to have_http_status(:success)
#     end
#   end