class Api::DonationsController < ApiController

  def create
    @donation = Donation.new(permitted_params)
    if @donation.save
      respond_to do |format|
        format.json { render :json => @donation }
      end
    else
      respond_to do |format|
        format.json { render :json => { :errors => @donation.errors.full_messages }, :status => 400 }
      end
    end
  end

  def show_for_donor
    @donations = Donation.where(donor_id: params[:id])
    render_donations
  end

  def show_for_referrer
    @donations = Donation.where(referrer_id: params[:id])
    render_donations
  end

  private
  def render_donations
    total = 0
    donors = []
    @donations.each do |d|
      total += d[:value].to_f
      donors << d[:donor_id]
    end

    respond_to do |format|
      format.json { render :json => {
        :total_value => total,
        :count => @donations.size,
        :unique_donors => donors.uniq.size,
        :donations => @donations
      }}
    end
  end

  def permitted_params
    params.permit(
      :donor_id,
      :referrer_id,
      :currency,
      :value,
      :transaction_id,
      :transaction_source_id
    )
  end
end