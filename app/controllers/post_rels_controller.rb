class PostRelsController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    micropost = Micropost.find(params[:like_id])
    current_user.like(micropost)
    flash[:success] = 'お気に入りに追加しました。'
    redirect_back(fallback_location: root_path)
  end

  def destroy
    micropost = Micropost.find(params[:like_id])
    current_user.unlike(micropost)
    flash[:success] = 'お気に入りを解除しました。'
    redirect_back(fallback_location: root_path)
  end
  
  private
  
  def correct_user
    @micropost = current_user.microposts.find_by(id: params[:id])
    if @micropost
      redirect_to root_url
    end
  end
end
