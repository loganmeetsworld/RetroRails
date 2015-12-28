require 'rails_helper'

RSpec.describe Team, type: :model do
  describe "validations" do 
    before :each do 
      @team = Team.create(name: 'test',password: 'test', password_confirmation: 'test')
      @bad_team = Team.create()
    end

    it "requires name and pass" do 
      expect(@bad_team.errors.keys).to include(:name)
      expect(@bad_team.errors.keys).to include(:password)
    end

    it "successfully auths team"  do 
      expect(@team).to be_valid
    end
  end

end
