require 'json' 
class FriendsController < ApplicationController
  def all

  end

  def view
  end

  def new
  end

  def create
  end

  def delete
  end

  def update
  end
  def find
    @user = current_user
  end

  def search
    users = User.all.where(user_name:search_params[:user_name])
    if users == nil
      json_data = {:people=>"No Users Found"}
    else
      user_data = users[0];
    json_data = {:people=>users_data}
    render json:json_data

    end
   
  end

private
  def search_params
    params.require(:friend).permit(:user_name)
  end
end
