class LikesController < ApplicationController
  def all
  end

  def view
  end

  def new
  end

  def create
    #like an event
    #put a new entry on the table 
    like = Like.new(like_params)
    if like.save
      #update emetrics table 
      emetric= Emetric.all.where(event_id:like_params[:event_id])
      # get the emetric like value and then add it together
      number_of_likes = emetric[0][:like_num]
      updated_likes = number_of_likes +1
      emetric_update = Emetric.find(emetric[0][:id]).update(like_num:updated_likes)

      json_data ={message:"success",event_id:like_params[:event_id], user_id:like_params[:user_id]}
      render json:json_data

      # flash[:message]='You Liked the Event'
      # redirect_to "/streams/interact/#{like_params[:event_id]}"
    else
      json_data ={message:"Fail",event_id:like_params[:event_id], user_id:like_params[:user_id]}
      render json:json_data
    end
    
  end

  def update
  end

  def delete
      @user = current_user 
      # find the like associated with the event
      like = Like.all.where(user_id:like_params[:user_id], event_id:like_params[:event_id])


      if like.length >0
        # like exist
        #check if current user has auth
        if @user.id == like[0][:user_id]
          delete_like = Like.find(like[0][:id]).delete
          #update eMetrics
          #get emetrics associated with the event
          emetrics = Emetric.all.where(event_id:like_params[:event_id])
          previous_likes = emetrics[0][:like_num]
          #subtract the user's like
          new_like = previous_likes -1
          #update the like
          emetric_update = Emetric.find(emetrics[0][:id]).update(like_num:new_like)

          json_data= {message:"success",user_id:like_params[:user_id], event_id:like_params[:event_id]}
          render json:json_data
        else
          json_data =  {message:"You Don't Have Permission"}
          render json:json_data
        end
      end
  end
  private

  def like_params
    params.require(:like).permit(:user_id, :event_id)
  end
end
