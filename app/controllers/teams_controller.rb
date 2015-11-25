class TeamsController < ApplicationController
	before_action :get_team, only: [:edit, :update]

	def get_team
		@team = Team.find(params[:id])
	end

	def new
		@team = Team.new
	end

	def delete
		@team = Team.destroy(params[:id])
	end

	def create
		Team.create(team_params[:team])
		redirect_to "/users"
	end

	def edit
	end

	def update
		@team.update(team_params[:team])
		redirect_to "/users"
	end

	private

	def team_params
		params.permit(team:[:name, :bio, :password])
	end
end
