class Api::UsersController < ApiController

  def create
    if (@user = User.find_by_email(params[:email]))
      render_user_json
    else
      @user = User.new(permitted_params)
      if @user.save
        render_user_json
      else
        respond_to do |format|
          format.json { render :json => { :errors => @user.errors.full_messages }, :status => 400 }
        end
      end
    end
  end

  def show
    @user = User.find(params[:id])
    render_user_json
  end

  private
  def render_user_json
    respond_to do |format|
      format.json { render :json => @user }
    end
  end

  def permitted_params
    params.permit(
      :name,
      :email,
      :phone
    )
  end
end