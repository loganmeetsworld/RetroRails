class SessionsController < ApplicationController
  def new
  end

  def show
  	@team = Team.find(params[:id])
  end

  def create
	  team = Team.authenticate(params[:name], params[:password])
	  if team
	    session[:team_id] = team.id
	    redirect_to team_path(team), :notice => "Logged in!"
	  else
	    flash.now.alert = "Invalid name or password"
	    redirect_to log_in_path
	  end
	end

	def destroy
	  session[:team_id] = nil
	  redirect_to root_url, :notice => "Logged out!"
	end
end
