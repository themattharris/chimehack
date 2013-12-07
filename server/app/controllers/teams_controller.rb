class TeamsController < ApplicationController
  def new
    @team = Team.new
  end

  def create
    @team = Team.new(team_params)

    if @team.save
      redirect_to teams_path
    else
      render 'new'
    end
  end

  def edit
    @team = Team.find(params[:id])
  end

  def update
    @team = Team.find(params[:id])

    if @team.update(team_params)
      redirect_to teams_path
    else
      render 'edit'
    end
  end

  def show
    @team = Team.find(params[:id])
  end

  def profile
    # Don't explode on missing team while in demo
    @team = Team.find_by_id(params[:id])
  end

  def index
    @teams = Team.all
  end

  private
  def team_params
    params.require(:team).permit(
      :name
    )
  end
end
