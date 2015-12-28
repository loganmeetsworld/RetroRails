require 'rails_helper'

RSpec.describe TeamsController, type: :controller do
	
  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET 'show'" do
    Team.create(name: "testytest", password: "test", password_confirmation: "test")
    it "renders the show view for a team" do
      get :show, id: 1
      expect(response.status).to eq 200
    end
  end

  describe "POST 'create'" do 
    let(:good_params) do 
      {
        team: {
          name: 'name_2',
          password: 'test',
          password_confirmation: 'test'
        }
      }
    end

    let(:bad_params) do 
      {
        team: {
          password: 'test',
          password_confirmation: 'test'
        }
      }
    end

    it "creates team" do 
      post :create, good_params 
      expect(Team.count).to eq 2
    end

    it "redirects to login page" do 
      post :create, good_params
      expect(subject).to redirect_to new_session_path
    end

    it "renders new with bad params" do 
      post :create, bad_params
      expect(subject).to render_template(:new)
    end
  end



end