class UsersController < ApplicationController
  # GET /api/users?page=2
  def index
    @users = User.paginate(page: params[:page], per_page: 5)
    render json: @users
  end

  def show
    @user = User.find(params[:id])
    render json: @user
  end
  #bin/rake namespace:update_dates
  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email)
  end


end
