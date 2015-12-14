class UsersController < ApplicationController
  before_action :set_user, only: [:update, :edit]
  
  def show
    @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @user.update(user_params)
      flash[:info] = "プロフィールを編集しました"
      redirect_to user_path   
    else
      flash[:alert] = "プロフィールを編集しました"
    end
  end
    
  private
  
  def user_params
    params.require(:user).permit(:name,:email,:password,
    :area,:greet)
  end
  
  def set_user
    @user = current_user
  end
  
end
