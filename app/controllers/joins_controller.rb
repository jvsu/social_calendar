require 'json' 

class JoinsController < ApplicationController
  def all
  end

  def view
  end

  def new
  end

  def create
    join = Join.new(join_params) #creates the new entry on the table
    if join.save
      emetric = Emetric.all.where(event_id:join_params[:event_id])
      number_of_joins = emetric[0][:join_num]
      join_calc = number_of_joins +1
      update = Emetric.find(emetric[0][:id]).update(join_num:join_calc)
      # check if join threshold is met
      event = Event.find(join_params[:event_id])

      json_data = {message:"success",event_id:join_params[:event_id],user_id:join_params[:user_id],join_num:join_calc,join_threshold:event.join_threshold}
      render json:json_data
    else
      json_data ={message:"fail",event_id:join_params[:event_id], user_id:join_params[:user_id]}
      render json:json_data
    end


  end

  def update
  end

  def confirm
    # find the join account
      join = Join.all.where(user_id:confirm_params[:user_id], event_id:confirm_params[:event_id])
    # update confirm to true
      confirm = Join.find(join[0][:id]).update(confirm:confirm_params[:confirm])
    # ajax response back 
      json_data = {message:"You have confirmed",event_id:confirm_params[:event_id]}
      render json:json_data
  end

  def delete
    #update emetrics... -1
    @user = current_user
    #find the join entry belonging to the usere. 
    join = Join.all.where(user_id:join_params[:user_id],event_id:join_params[:event_id])
    event = Event.find(join_params[:event_id])
    if join.length >0 #if join exists
      if @user.id ==join[0][:user_id]  #if the current user owns the account
        delete_join = Join.find(join[0][:id]).delete
        
        #update eMetrics
        #get emetrics associated with the event
        emetrics = Emetric.all.where(event_id:join_params[:event_id])
        previous_joins = emetrics[0][:join_num]
        #subtract the user's join
        new_join = previous_joins-1
        emetric_update = Emetric.find(emetrics[0][:id]).update(join_num:new_join)
        json_data = {message:"success",user_id:join_params[:user_id],event_id:join_params[:event_id],join_num:new_join, join_threshold:event.join_threshold}
        render json:json_data
      else
        json_data = {message:"You Don't Have Permission"}
        render json:json_data
      end  
    end
  
  end

  private
   def join_params
    params.require(:join).permit(:user_id, :event_id)
  end
  def confirm_params
    params.require(:join).permit(:user_id,:event_id,:confirm)
  end
end
