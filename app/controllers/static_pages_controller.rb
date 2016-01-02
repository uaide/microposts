class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @micropost = current_user.microposts.build
      @feed_items = current_user.feed_items.includes(:user).order(created_at: :desc)
    end
  end
  def index
    @micropost = current_user.microposts.build
    @search_items = @micropost.search_items(params[:search][:word]);
  end
end