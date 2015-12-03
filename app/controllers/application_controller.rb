class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_team

  private

  def current_team
    @current_team ||= Team.find(session[:team_id]) if session[:team_id]
  end

  def note_params
    params.permit(note:[:content, :cat_id, :team_id, :retro_id, :conclussion, :upvote, :complete_status])
  end
end
