class Admin::IncentivesController < ApplicationController
  before_filter :find_contextual_incentive, :except => [:index]

  def create
    if @incentive.save
      redirect_to admin_incentives_path
    else
      render 'new'
    end
  end

  def edit
  end

  def index
    @incentives = Incentive.all
  end

  def new
  end

  def show
  end

  def update
    if @incentive.update(incentive_params)
      redirect_to admin_incentives_path
    else
      render 'edit'
    end
  end

  private
  def incentive_params
    params.require(:incentive).permit(
      :value,
      :description,
    )
  end

  def find_contextual_incentive
    @incentive = if (id = params[:id]).present?
      Incentive.find(id)
    elsif params[:incentive]
      Incentive.new(incentive_params)
    else
      Incentive.new
    end
  end
end