class RetrosController < ApplicationController
	def index
		@team = Retro.find(params[:team_id])
		@retros = Retro.where(team_id: @team.id)
	end

	def show 
		@retro = Retro.find(params[:id])

		@notes = Note.where(retro_id: @retro.id)
		@one = @notes.where("cat_id = '1'")
		@two = @notes.where("cat_id = '2'")
		@three = @notes.where("cat_id = '3'")
		@four = @notes.where("cat_id = '4'")
	end

	def new
		@note = Note.new
		@retro = Retro.new
		@title = "New Note"
		@action = "create"
	end

	def create
  	Retro.create(retro_params)

  	team_id = params[:team_id]
		redirect_to team_path(team_id)
  end

  def edit
  	@action = "update"
  	@title = "Update Note"
  	@retro = Retro.find(params[:id])
  end

  def update
  	@retro = Retro.find(params[:id])

  	@retro.update(retro_params)
  	redirect_to team_retro_path(current_team, @retro)
  end

  def destroy
		@retro = Retro.destroy(params[:id])

		redirect_to team_retros_path(@retro)
	end

  private

  def retro_params
		retro = params.require(:retro).permit(:name)
		retro.merge(params.permit(:team_id))
	end
end
