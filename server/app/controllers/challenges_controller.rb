class ChallengesController < ApplicationController
  def new
    @challenge = Challenge.new
  end

  def create
    @challenge = Challenge.new(challenge_params)

    if @challenge.save
      redirect_to challenges_path
    else
      render 'new'
    end
  end

  def edit
    @challenge = Challenge.find(params[:id])
  end

  def update
    @challenge = Challenge.find(params[:id])

    if @challenge.update(challenge_params)
      redirect_to challenges_path
    else
      render 'edit'
    end
  end

  def show
    @challenge = Challenge.find(params[:id])
  end

  def index
    @challenges = Challenge.all
  end

  private
  def challenge_params
    params.require(:challenge).permit(
      :name,
      :description,
      :target,
      :currency,
      :current,
      :target_date,
    )
  end
end
