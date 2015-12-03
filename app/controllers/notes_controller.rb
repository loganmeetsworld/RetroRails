class NotesController < ApplicationController
  before_action only: [:index, :show, :new, :create, :edit, :update, :destroy, :complete, :incomplete] { @retro = Retro.find(params[:retro_id]) }
  before_action only: [:index, :show, :new, :create, :edit, :update, :destroy, :complete, :incomplete] { @team = Team.find(params[:team_id]) }
  before_action only: [:show, :edit, :update, :destroy] { @note = Note.find(params[:id])}

  def index
    notes = Note.where(retro_id: @retro.id)
    @one = notes.where("cat_id = '1'").order(:upvote).reverse
    @two = notes.where("cat_id = '2'").order(:upvote).reverse
    @three = notes.where("cat_id = '3'").order(:upvote).reverse
    @four = notes.where("cat_id = '4'").order(:upvote).reverse
  end

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
    @note.update(:date_complete => Time.now)
    redirect_to team_retro_path(@team, @retro)
  end

  def incomplete
    @note.update(:date_complete => nil)
    redirect_to team_retro_path(@team, @retro)
  end

  private

  def note_params
    params.permit(note:[:content, :cat_id, :team_id, :retro_id, :conclussion, :upvote, :complete_status])
  end
end
