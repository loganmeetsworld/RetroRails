class TeamsController < ApplicationController
  before_action only: [ :show, :edit ] { @team = Team.find(params[:id]) }

  def show
    if params[:retro_select].present?
      redirect_to(team_retro_path(params[:id], params[:retro_select]))
    end
  end

  def new
    @team = Team.new
  end

  def create
    @team = Team.new(team_params)
    if @team.save
      redirect_to new_session_path, :notice => "Signed up!"
    else
      render "new"
    end
  end

  private

  def team_params
  params.require(:team).permit(:name, :password, :salt, :encrypted_password)
  end
end
