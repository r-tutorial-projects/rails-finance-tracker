class UsersController < ApplicationController
  def my_portfolio
    @stocks = current_user.stocks
    @user = current_user
  end

  def my_friends
  end

  def search
    if params[:friend].present?
      @friends = current_user.search params[:friend]
      if @friends
        respond_to do |format|
          format.js { render partial: 'users/friend_result' }
        end
      else
        flash.now[:alert] = "Can't find user: '#{params[:friend]}'."
        respond_to do |format|
          format.js { render partial: 'users/friend_result' }
        end
      end
    else
      flash.now[:alert] = 'Please enter a name or email to search for'
      respond_to do |format|
        format.js { render partial: 'users/friend_result' }
      end
    end
  end

  def show
    @user = User.find params[:id]
    @stocks = @user.stocks
  end
end
