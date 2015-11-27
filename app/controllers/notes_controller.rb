class NotesController < ApplicationController
	def new
		@note = Note.new
	end

	def create
  	Note.create(note_params)
  	retro_id = params[:retro_id]
  	@retro = Retro.find(retro_id)

		redirect_to team_retro_path(current_team, @retro)
  end

  private

  def note_params
		note = params.require(:note).permit(:content, :cat_id)
		note.merge(params.permit(:retro_id))
	end
end
