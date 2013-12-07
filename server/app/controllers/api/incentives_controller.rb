class Api::IncentivesController < ApiController
  def index
    @incentives = Incentive.all
    respond_to do |format|
      format.json { render :json => @incentives }
    end
  end

  def show
    @incentive = Incentive.find_by! value: params[:value]
    respond_to do |format|
      format.json { render :json => @incentive }
    end
  end
end