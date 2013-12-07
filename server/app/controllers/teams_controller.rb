class TeamsController < ApplicationController
  def profile
    # Don't explode on missing team while in demo
    @team = Team.find(1)
    @challenge = Challenge.find(1)
    @user = @team.users.first # Shoud be Allison
  end
end
