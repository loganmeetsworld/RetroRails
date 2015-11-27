class NotesController < ApplicationController
	def new
		@note = Note.new
		@action = "create"
	end

	def create
  	Note.create(note_params)

  	retro_id = params[:retro_id]
		redirect_to team_retro_path(retro_id)
  end

  private

  def note_params
		note = params.require(:note).permit(:content)
		retro.merge(params.permit(:retro_id))
	end
end
