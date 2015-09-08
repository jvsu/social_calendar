require 'json' 
class FriendRequestsController < ApplicationController
  def new
  end

  def create
    request = FriendRequest.new(request_params)
    if request.save
      json_data = {status:'success'}
      render json:json_data
    else
      json_data ={status:'fail'}
      render json:json_data
    end
  end

  def view
  end

  def all
    @user = current_user

    @avatar = Avatar.all
    @pic = false
    #circle Assignments
    your_circles = Circle.all.where(user_id:@user.id)
    circle_names =["uncategorized","new circle"]
    your_circles.each do |circ|
      circle_names.push(circ.name)
    end
    @circle_names = circle_names.uniq

    @circles = FriendRequest.all.where(user_id:@user.id,pending_requester:true)
    @circle_length = @circles.length
    @your_requests = []

    # list of all the users to put into circles
    @circles.each do |c|
      @your_requests.push(User.find(c.friend_id))
    end

    @requests = FriendRequest.all.where(friend_id:@user.id, pending_requester:true)
    @request_length = @requests.length
    #end of circle assignments

    #friend requests
    @friend_requests = FriendRequest.all.where(friend_id:@user.id,pending_confirmer:true)
    @friend_requests_length = @friend_requests.length
    
    
  end

  def update

  end

  def delete
  end
  private
  def request_params
     params.require(:friend).permit(:friend_id,:user_id,:pending_requester, :pending_confirmer)
  end
end
