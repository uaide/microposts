class UsersController < ApplicationController
  before_action :set_user, only: [:update, :edit, :show]
  
  
  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.order(created_at: :desc)
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
    chk_user
  end
  
  def update
    chk_user
    if @user.update(user_params)
      flash[:info] = "プロフィールを編集しました"
      redirect_to user_path   
    else
      render 'edit'
    end
  end

    
  private
  
  def user_params
    params.require(:user).permit(:name,:email,:password,:password_confirmation,
    :area,:greet)
  end
  
  def set_user
    @user = User.find(params[:id])
  end
  
  def chk_user
    @user = User.find(params[:id])
    if logged_in? && @user == current_user
    else
      flash[:warning] = "no access!"
      redirect_to root_path
    end  
  end
  
end
