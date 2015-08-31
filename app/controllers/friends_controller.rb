require 'json' 
class FriendsController < ApplicationController
  def all
    @user = current_user
    @circles = Circle.all.where(user_id:@user.id)
    @friends = Friend.all
    @people = User.all
  end

  def view
  end

  def new
  end

  def create

    #update FriendRequest column pending_confirmer to false
    update_friend_request = FriendRequest.find(confirm_friend_params[:fr_id]).update(pending_confirmer:false)

    #add circle 
    if confirm_friend_params[:name] =="new circle" # if new circle
      #check to see if the new name exist first, if not add it.
      check = Circle.all.where(user_id:confirm_friend_params[:confirmer_id], name:confirm_friend_params[:new_name])
      if check.length ==0 
      # if it doesn't exist create the cirlce
        new_circle = Circle.new(user_id:confirm_friend_params[:confirmer_id],name:confirm_friend_params[:new_name]).save
        #get the info on current circle you just created
        new_circle_info = Circle.all.where(user_id:confirm_friend_params[:confirmer_id],name:confirm_friend_params[:new_name])

        # create new entry on friends table
        new_friend = Friend.new(user_id:confirm_friend_params[:confirmer_id],circle_id:new_circle_info[0][:id],friend_num:confirm_friend_params[:requester_id], confirmed:true).save

        flash[:message]='Friend Request Confirmed'
        redirect_to "/friend_requests/all"

      else
        #if circle name already exists
        flash[:message]='Name Already Exists'
        redirect_to "/friend_requests/all" 
      end

    else   #if name isn't new circle
      #find the circle 
      find_circle = Circle.all.where(user_id:confirm_friend_params[:confirmer_id],name:confirm_friend_params[:name])
      if(find_circle.length==0)
        #create Circle
        #if it's uncategorized for the first time 
        new_circle = Circle.new(user_id:confirm_friend_params[:confirmer_id],name:confirm_friend_params[:name]).save

        #create new entry on friends table
        new_circle_info = Circle.all.where(user_id:confirm_friend_params[:confirmer_id], name:confirm_friend_params[:name])
        new_friend = Friend.new(user_id:confirm_friend_params[:confirmer_id],circle_id:new_circle_info[0][:id],friend_num:confirm_friend_params[:requester_id], confirmed:true).save
        flash[:message]='Friend Request Confirmed'
        redirect_to "/friend_requests/all"
      else
        #entry found

        #create new entry on friends table
        new_friend = Friend.new(user_id:confirm_friend_params[:confirmer_id],circle_id:find_circle[0][:id],friend_num:confirm_friend_params[:requester_id], confirmed:true).save
        flash[:message]='Friend Request Confirmed'
        redirect_to "/friend_requests/all"
     end
    end

  end

  def delete
  end

  def update
  end
  def find
    @user = current_user
  end

  def search
    user = current_user
    users = User.all.where(user_name:search_params[:user_name])
    users_len = users.length
    # #get circles 
    # circles = ['uncategorized','new']
    # get_circles = Circle.all.where(user_id:user.id)
    # # something is returned then put the names into a list
    # if get_circles.length >0
    #   get_circles.each do |c|
    #     circles.push(c.name)
    #   end
    # end
    # #remove the uniques
    #   circles = circles.uniq
    
    # user record 
    if users_len == 0
      json_data = {:people=>"No Users Found"}
      render json:json_data
    else
        status = FriendRequest.all.where(user_id:user.id,friend_id:users[0][:id])
        reverse_status = FriendRequest.all.where(user_id:users[0][:id], friend_id:user.id)
        status_len = status.length
        reverse_len = reverse_status.length

        # Relationship Status
        if status_len == 0 && reverse_len==0 # no friend request exists
          status_update = "Friend Request"

        elsif status_len>0 # if the status record exists, then do these if statments

          if status[0][:pending_confirmer]==true  #I sent a friend request, but it hasn't been accepted
            status_update ="Pending"
          elsif  status[0][:pending_requester]==true && status[0][:pending_confirmer] == false #I sent one and it is accepted, but I have not assigned a circle
           status_update ="Circle"
          elsif  status[0][:pending_requester]==false && status[0][:pending_confirmer] == false # I sent on and it is accepted and I have assigned a circle
            status_update = "Unfriend"
          elsif status[0][:pending_requester] == false && status[0][:pending_confirmer] == true
            status_update = "Pending"
          end
        elsif reverse_len >0 #if other record exists, do these if statments
          # if reverse_status returns something
          if reverse_status[0][:pending_confirmer] ==true #someone sent you a friend request and you haven't confirmed
            status_update = "Confirm"
          else reverse_status[0][:pending_confirmer] ==false # you aleardy confirmed friend request
              status_update = "Unfriend"
          end
        else
          status_update = "Unknown"
      end
        user_data = users[0]
        json_data = {people:"User Found",current_user_id:user.id,friend_id:users[0][:id],status:status_update,email:users[0][:email],first_name:users[0][:first_name],last_name:users[0][:last_name],user_name:users[0][:user_name], gender:users[0][:gender],birthday:users[0][:birthay],avatar:users[0][:avatar]}
        render json:json_data
    end
  end

private
  def search_params
    params.require(:friend).permit(:user_name)
  end
  def confirm_friend_params
    params.require(:friend).permit(:fr_id,:requester_id,:confirmer_id,:name,:new_name)
  end
end
