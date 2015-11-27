class NotesController < ApplicationController
	def new
		@note = Note.new
		@title = "New Note"
		@action = "create"
	end

	def create
  	@action = "create"
  	Note.create(note_params)
  	retro_id = params[:retro_id]
  	@retro = Retro.find(retro_id)

		redirect_to team_retro_path(current_team, @retro)
  end

  def edit
  	@title = "Update Note"
  	@action = "update"
  	@note = Note.find(params[:id])
  end

  def update
  	@note = Note.find(params[:id])
  	@retro = Retro.find(params[:id])

  	@note.update(note_params)
  	redirect_to team_retro_path(current_team, @retro)
  end

  def destroy
		@note = Note.destroy(params[:id])
		@retro = Retro.find(params[:id])

		redirect_to team_retro_path(current_team, @retro)
	end

  private

  def note_params
		note = params.require(:note).permit(:content, :cat_id)
		note.merge(params.permit(:retro_id))
	end
end
