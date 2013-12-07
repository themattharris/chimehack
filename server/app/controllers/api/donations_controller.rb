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
    @donation = Donaction.find_by_donor_id(params[:donor_id])
    respond_to do |format|
      format.json { render :json => @donation }
    end
  end

  def show_for_referrer
    @donation = Donaction.find_by_referrer_id(params[:referrer_id])
    respond_to do |format|
      format.json { render :json => @donation }
    end
  end

  private
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