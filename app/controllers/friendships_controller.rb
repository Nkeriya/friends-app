class FriendshipsController < ApplicationController

  def create
  end
  
  def destroy
  end

  def show
    @user = User.find_by(id: params[:id])
    @friends = @user.friends.concat(@user.inverse_friends).uniq
  end

end