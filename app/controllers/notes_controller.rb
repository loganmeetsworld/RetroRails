class NotesController < ApplicationController
	before_action only: [:edit, :update, :complete, :incomplete] { @note = Note.find(params[:id]) }
	before_action only: [:new, :create, :edit, :update, :destroy, :complete, :incomplete] { @retro = Retro.find(params[:retro_id]) }
	before_action only: [:new, :create, :edit, :update, :destroy, :complete, :incomplete] { @team = current_team }

	def new
		@note = Note.new

		@title = "New Note"
		@action = "create"
		@url = "/teams/#{@team.id}/retros/#{@retro.id}/notes"
	end

	def create
  	Note.create(note_params[:note])
		redirect_to team_retro_path(@team, @retro)
  end

  def edit
  	@title = "Update Note"
  	@action = "update"
  	@url = "/teams/#{@team.id}/retros/#{@retro.id}/notes/#{@note.id}"
  end

  def update
  	@note.update(note_params[:note])
  	redirect_to team_retro_path(@team, @retro)
  end

  def destroy
		Note.destroy(params[:id])
		redirect_to team_retro_path(@team, @retro)
	end

	def complete
		@note.date_complete = Time.now
		redirect_to team_retro_path(@team, @retro)
	end

	def incomplete
		@note.date_complete = nil
		redirect_to team_retro_path(@team, @retro)
	end

  private

  def note_params
  	params.permit(note:[:content, :cat_id, :retro_id])
	end
end
