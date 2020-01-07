class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show; end

  def new
    @user = User.new
    @user.profiles.build
  end

  def edit;end

  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = "Create successfully!"
      redirect_to users_url
    else
      render :new
    end
  end

  def update
    if @user.update_attributes user_params 
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
    begin
      @user.destroy!
      flash[:success] = "User deleted"
    rescue
      flash[:danger] = "Cannot delete user"
    end
    redirect_to users_url
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :email, :dob, :gender, :height, :role, :description, :city_id,
        profiles_attributes: [:id, :address, :_destroy])
    end
end
