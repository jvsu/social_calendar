class CirclesController < ApplicationController
  def index
  end

  def new
  end

  def create
  	 #create a circle, friend entry, update friend request
  		if(circle_params[:name]=="new circle") 
  			#create new circle
  			circ = Circle.new(name:circle_params[:new_name],user_id:circle_params[:user_id])
  			if circ.save
  				#if circle saves
          #create entry on friends table
  				friend = Friend.new(user_id:circle_params[:user_id],circle_id:circ.id,friend_num:circle_params[:friend_id],confirmed:true).save
  				
          #find the friend_request entry 
          friend_request = FriendRequest.all.where(user_id:circle_params[:user_id],friend_id:circle_params[:friend_id])
  				
          #update friend_request pending_requester to confirm you assigned your friend to a circle. 
          update = FriendRequest.find(friend_request[0][:id]).update(pending_requester:false)
  				
          flash[:message]="Friend Added to Circle" 
  				redirect_to "/friend_requests/all"
  				
          else
  				#if circle doesn't save
          #db error messages here
  				flash[:message]="Friend Not Added to Circle" 
  				redirect_to "/friend_requests/all"
  			end
  		else
  			#if not a new circle
  			#find the id of the circle name
  			circle = Circle.all.where(:name=>circle_params[:name],user_id:circle_params[:user_id])
  			#if uncategorized doesn't exist already put it in
  			if circle.length ==0 
          #create the new circle here
  				new_circle = Circle.new(name:circle_params[:name],user_id:circle_params[:user_id]).save
          #add to the friends table
  				friend = Friend.new(user_id:circle_params[:user_id],circle_id:new_circle.id,friend_num:circle_params[:friend_id],confirmed:true)
  				if friend.save
  					#update friend request
  					friend_request = FriendRequest.all.where(user_id:circle_params[:user_id],friend_id:circle_params[:friend_id])
  					update = FriendRequest.find(friend_request[0][:id]).update(pending_requester:false)

  				flash[:message]="Friend Added to Circle" 
  				redirect_to "/friend_requests/all"
  				else
	  				flash[:message]="Friend Not Added to Circle" 
	  				redirect_to "/friend_requests/all"
  				end
  			else
  				circ=circle[0]
	  			friend = Friend.new(user_id:circle_params[:user_id],circle_id:circ[:id],friend_num:circle_params[:friend_id],confirmed:true)
	  			friend_request = FriendRequest.all.where(user_id:circle_params[:user_id],friend_id:circle_params[:friend_id])
  				update = FriendRequest.find(friend_request[0][:id]).update(pending_requester:false)
 
	  			if friend.save
	  				flash[:message]="Friend Added to Circle" 
	  				redirect_to "/friend_requests/all"
	  			else
	  				flash[:message]="Friend Not Added to Circle" 
	  				redirect_to "/friend_requests/all"
	  			end
  			end
  		end
  end
  private
  def circle_params
  	params.require(:circle).permit(:friend_id,:name,:new_name,:user_id)
  end
end
