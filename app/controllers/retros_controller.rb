class RetrosController < ApplicationController
	before_action only: [:show, :index, :create, :update, :destroy] { @team = current_team }
	before_action only: [:show, :edit, :update, :destroy] { @retro = Retro.find(params[:id]) }
	before_action only: [:show, :edit, :update, :destroy] { if @retro.notes.size != 0 then @note = Note.find(params[:id]) end }

	def index
		@retros = Retro.where(team_id: @team.id)
	end

	def show 
		redirect_to team_retro_notes_path(@team, @retro)
	end

	def new
		@retro = Retro.new

		@title = "New Retro"
		@action = "create"
	end

	def create
  	Retro.create(retro_params[:retro]) 

		redirect_to team_path(@team)
  end

  def edit
  	@title = "Update Retro"
  	@action = "update"
  end

  def update
  	@retro.update(retro_params[:retro])
  	redirect_to team_retro_path(@team, @retro)
  end

  def destroy
		Retro.destroy(params[:id])

		redirect_to team_path(@team)
	end

  private

  def retro_params
  	params.permit(retro:[:name, :team_id])
	end
end
