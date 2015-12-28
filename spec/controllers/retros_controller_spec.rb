require 'rails_helper'

RSpec.describe RetrosController, type: :controller do
  before :each do
    @current_team = Team.create(name: "test", password: "test", password_confirmation: 'test')
    session[:team_id] = @current_team.id
    @retro = Retro.create(name: 'week', team_id: @current_team.id)
  end

  describe "GET 'new'" do
    it "renders the new view" do
      get :new, team_id: @current_team
      expect(response).to render_template("new")
    end
  end

  describe "POST 'create'" do
    let(:good_params) do
      {
        retro: {
          name: 'stuff',
          team_id: 1,
        }
      }
    end

    let(:bad_params) do
      {
        retro: {
        }
      }
    end

    let(:create_params) do
      {
        retro: {
          name: 'another name',
          team_id: 2,
        }
      }
    end

    it "redirects to the retro show page on success" do
      post :create, good_params
      expect(response).to redirect_to team_path(@current_team)
    end

    it "renders the new form if unsuccessful" do
      post :create, bad_params
      expect(subject).to render_template 'new'
    end
  end

  describe "GET 'edit'" do
    it "renders the edit form" do
      get :edit, id: @retro.id
      expect(response.status).to eq 200
      expect(subject).to render_template 'edit'
    end
  end

  describe "PATCH 'update'" do
    let(:change_params) do
      {
        retro: {
          name: 'stuff',
          team_id: 2,
        }
      }
    end

    let(:bad_change_params) do
      {
        retro: {
        }
      }
    end

    it "updates a retro" do
      patch :update, { id: @retro.id }.merge(change_params)
      @retro.reload
      expect(retro.find(@retro.id).name).to eq "stuff"
    end

    it "redirects to team page if successful" do
      patch :update, { id: @retro.id }.merge(change_params)
      @retro.reload
      expect(response).to redirect_to team_path(@retro.team_id)
    end

    it "renders edit page if unsuccessful" do
      patch :update, { id: @retro.id }.merge(bad_change_params)
      @retro.reload
      expect(response).to render_template 'edit'
    end
  end

  describe "DESTROY 'delete'" do
    it "deletes a retro" do
      delete :destroy, id: @retro.id
      expect(@retro).to eq nil
    end

    it "redirects to team account page" do
      delete :destroy, id: @retro.id
      expect(response).to redirect_to team_path(@current_team)
    end
  end

end
