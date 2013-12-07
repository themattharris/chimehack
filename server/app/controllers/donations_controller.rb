class DonationsController < ApplicationController
  def new
    @donation = Donation.new
  end

  def create
    @donation = Donation.new(donation_params)

    if @donation.save
      redirect_to donations_path
    else
      render 'new'
    end
  end

  def edit
    @donation = Donation.find(params[:id])
  end

  def update
    @donation = Donation.find(params[:id])

    if @donation.update(donation_params)
      redirect_to donations_path
    else
      render 'edit'
    end
  end

  def show
    @donation = Donation.find(params[:id])
  end

  def index
    @donations = Donation.all
  end

  private
  def donation_params
    params.require(:donation).permit(
      :currency,
      :value
    )
  end
end
