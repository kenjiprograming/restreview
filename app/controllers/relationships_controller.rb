class RelationshipsController < ApplicationController

  

  def create
    relationship= current_user.relationships.find_or_initialize_by(follow_id: params[:id])
    # binding.pry
    if relationship.save
      flash[:success] = 'ユーザーをフォローしました'
      redirect_to "/users/#{params[:id]}"
    else
      flash.now[:alert] = 'ユーザーのフォローに失敗しました'
      redirect_to "/users/#{params[:id]}"
    end
  end

  def destroy
    relationship = current_user.relationships.find_by(follow_id: params[:id])
    if relationship.destroy
      flash[:success] = 'ユーザーのフォローを解除しました'
      redirect_to "/users/#{params[:id]}"
    else
      flash.now[:alert] = 'ユーザーのフォロー解除に失敗しました'
      redirect_to "/users/#{params[:id]}"
    end
  end


end
