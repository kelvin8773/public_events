require 'rails_helper'

RSpec.describe EventsController, type: :controller do
  fixtures :users

  describe "GET #index" do
    it "returns http success" do
      user = users(:michael)
      
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show
      expect(response).to have_http_status(:success)
    end
  end

end
