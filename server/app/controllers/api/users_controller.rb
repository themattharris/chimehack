class Api::UsersController < ApiController

  def create
    # TODO find_by_email first and if exists, just return
    @user = User.new(permitted_params)
    if @user.save
      respond_to do |format|
        format.json { render :json => @user }
      end
    else
      respond_to do |format|
        format.json { render :json => @user.errors.full_messages, :status => 400 }
      end
    end
  end

  private
  def permitted_params
    params.permit(
      :name,
      :email,
      :phone
    )
  end
end