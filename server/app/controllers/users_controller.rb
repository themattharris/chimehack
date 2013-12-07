class UsersController < ApplicationController
  before_filter :find_contextual_user, :except => [:index]
  before_filter :find_teams, :except => [:index]

  def create
    if @user.save
      redirect_to users_path
    else
      render 'new'
    end
  end

  def edit
  end

  def index
    @users = User.all
  end

  def new
  end

  def show
  end

  def update
    if @user.update(user_params)
      redirect_to users_path
    else
      render 'edit'
    end
  end

  private
  def user_params
    params.require(:user).permit(
      :name,
      :email,
      :phone
    )
  end

  def find_contextual_user
    @user = if (id = params[:id])
      User.find(id)
    else
      User.new
    end
  end

  def find_teams
    @teams = Team.all
  end
end
