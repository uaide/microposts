class UsersController < ApplicationController
  before_action :set_user, only: [:update, :edit, :show]
  
  def show
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!" + "「" + @user.name + "」"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def edit
    if logged_in? && @user == current_user
    else
      flash[:warning] = "no access!"
      redirect_to root_path
    end
  end
  
  def update
    if @user.update(user_params)
      flash[:info] = "プロフィールを編集しました"
      redirect_to user_path   
    else
      flash[:danger] = "入力に誤りがあります。"
      render 'edit'
    end
  end

    
  private
  
  def user_params
    params.require(:user).permit(:name,:email,:password,
    :area,:greet)
  end
  
  def set_user
    @user = User.find(params[:id])
  end
  
end
