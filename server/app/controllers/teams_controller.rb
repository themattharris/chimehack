class TeamsController < ApplicationController
  def profile
    # Don't explode on missing team while in demo
    @team = Team.find_by_id(params[:id])
    @user = User.first
  end
end
