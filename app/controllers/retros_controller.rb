class RetrosController < ApplicationController
	def index
		@team = Retro.find(params[:team_id])
		@retros = Retro.where(team_id: @team.id)
	end

	def show 
		@retro = Retro.find(params[:id])
		@notes = Note.all
		@one = @notes.where("cat_id = '1'")
		@two = @notes.where("cat_id = '2'")
		@three = @notes.where("cat_id = '3'")
		@four = @notes.where("cat_id = '4'")
	end

	def new
		@note = Note.new
		@retro = Retro.new
		@action = "create"
	end

	def create
  	Retro.create(retro_params)

  	team_id = params[:team_id]
		redirect_to team_path(team_id)
  end

  private

  def retro_params
		retro = params.require(:retro).permit(:name)
		retro.merge(params.permit(:team_id))
	end
end
