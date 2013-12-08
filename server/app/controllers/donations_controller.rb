class DonationsController < ApplicationController

  def welcome
  end

  def thanks
  end

  def create
    @user = User.find(1) # Hardcode to Allison
    @donor = User.create({:name => params[:cardholder], :email => params[:email] })
    Donation.create({:referrer_id => @user.id, :donor => @donor, :value => params[:amount]})
    redirect_to("/donations/thanks")
  end
end
