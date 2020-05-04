class FriendshipsController < ApplicationController
  def create
    friend = find_friend
    current_user.friends << friend
    flash[:notice] = "#{friend.full_name} added to your friends"
    redirect_to my_friends_path
  end

  def destroy
    friend = find_friend
    friendship = current_user.friendships.where(friend_id: friend.id).first
    friendship.destroy
    flash[:notice] = "#{friend.full_name} removed from your friends"
    redirect_to my_friends_path
  end

    private
    def find_friend
      User.find params[:id]
    end
end
