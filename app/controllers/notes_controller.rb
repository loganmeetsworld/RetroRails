class NotesController < ApplicationController
	before_action only: [:edit, :update] { @note = Note.find(params[:id]) }
	before_action only: [:new, :create, :edit, :update] { @retro = Retro.find(params[:retro_id]) }
	before_action only: [:new, :create, :edit, :update] { @team = current_team }

	def new
		@note = Note.new

		@title = "New Note"
		@action = "create"
	end

	def create
  	Note.create(note_params[:note])
		redirect_to team_retro_path(@team, @retro)
  end

  def edit
  	@title = "Update Note"
  	@action = "update"
  end

  def update
  	@note.update(note_params[:note])
  	redirect_to team_retro_path(@team, @retro)
  end

  def destroy
		Note.destroy(params[:id])

		redirect_to team_retro_path(@team, @retro)
	end

  private

  def note_params
  	params.permit(note:[:content, :cat_id, :retro_id])
	end
end
