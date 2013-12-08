class TeamsController < ApplicationController
  def profile
    # Don't explode on missing team while in demo
    @team = Team.find(1)
    @challenge = Challenge.find(1)

    @donations = Donation.where(challenge_id: @challenge.id).sort_by do |donation|
      if donation.donor.present?
        donation.donor.total_donations
      else
        0
      end
    end.reverse
    @donations = @donations[0..2]

    @user = @team.users.first # Shoud be Allison
  end
end
