class EventsController < ApplicationController
  def all
  #   @user = current_user
  #   #Get events that meet the threshold. 
  #   @qualified_events = []
  #   #get events that belong to the user
  #   date = DateTime.now
  #   day = date.strftime("%d") #day
  #   year = date.strftime("%Y") #year
  #   month = date.strftime("%m") #month
  #   datetime = "#{year}-#{month}-#{day}"

  # #need to organize it based on days
  #   day = day.to_i #turn day into int
  #    #all events for the week
  #   upper_range_day = day +7
  #   upper_range_day = upper_range_day.to_s #convert it to string
  #   upper_range = "#{year}-#{month}-#{upper_range_day}"          #create the date
    
  #   # All events for the last 7 days
  #   events = Event.all.where(date:datetime..upper_range,user_id:@user.id)
  #   emetrics = Emetric.all
  #   emetric_collection =[]
  #   #get emetrics that belong to the queried events
  #   emetrics.each do |e|
  #     events.each do |event|
  #       if e.event_id ==event.id
  #         emetric_collection.push(e)
  #       end
  #     end
  #   end
  #   # now put into the @qaulified_events array all the records where the join threshold is met

  #  events.each do |event|
  #     emetric_collection.each do |e|
  #       if e.event_id == event.id && e.join_num >= event.join_threshold 
  #           @qualified_events.push(event)
  #       end
  #     end
  #   end

  #   #events for you said you would join and now need to confirm. 
  #   joins = Join.all.where(user_id:@user.id)
  #   inv_events = Event.all.where(date:datetime..upper_range,invitation:true)
  #   @invitations = []

  #   joins.each do |join|
  #     inv_events.each do |i| 
  #         if join.event_id == i.id  # if the event_id doesn't exist on the invitation table
  #           if join.confirm ==nil || join.confirm=='false'
  #             @invitations.push(join) 
  #           end
  #         end
  #     end
  #   end
   @user = current_user
    #Get events that meet the threshold. 
    @qualified_events = []
    #get events that belong to the user
    date = DateTime.now
    day = date.strftime("%d") #day
    year = date.strftime("%Y") #year
    month = date.strftime("%m") #month
    datetime = "#{year}-#{month}-#{day}"

  #need to organize it based on days
    day = day.to_i #turn day into int
     #all events for the week
    upper_range_day = day +7
    upper_range_day = upper_range_day.to_s #convert it to string
    upper_range = "#{year}-#{month}-#{upper_range_day}"          #create the date
    
    # All events for the last 7 days
    @events = Event.all.where(date:datetime..upper_range,user_id:@user.id)
  end

  def view
  end

  def new
  end

  def create
    new_event = Event.new(event_params)
    if new_event.save
      #create the emetrics table as well
      emetric = Emetric.new(event_id:new_event.id, save_num:0, join_num:0, like_num:0).save
       json_data = {:message=>'Event Created'}
      render json:json_data
    else
       json_data = {:message=>'Errors'}
      render json:json_data
    end
   
  end
  def confirm
    @user = current_user
    date = DateTime.now
    day = date.strftime("%d") #day
    year = date.strftime("%Y") #year
    month = date.strftime("%m") #month
    datetime = "#{year}-#{month}-#{day}"

  #need to organize it based on days
    day = day.to_i #turn day into int
     #all events for the week
    upper_range_day = day +7
    upper_range_day = upper_range_day.to_s #convert it to string
    upper_range = "#{year}-#{month}-#{upper_range_day}"          #create the date
    

    joins = Join.all.where(user_id:@user.id)
    inv_events = Event.all.where(date:datetime..upper_range,invitation:true)
    @invitations = []

    joins.each do |join|
      inv_events.each do |i| 
          if join.event_id == i.id  # if the event_id doesn't exist on the invitation table
            if join.confirm ==nil || join.confirm=='false'
              @invitations.push(join) 
            end
          end
      end
    end
  end

  def your_events
     @user = current_user
    #Get events that meet the threshold. 
    @qualified_events = []
    #get events that belong to the user
    date = DateTime.now
    day = date.strftime("%d") #day
    year = date.strftime("%Y") #year
    month = date.strftime("%m") #month
    datetime = "#{year}-#{month}-#{day}"

  #need to organize it based on days
    day = day.to_i #turn day into int
     #all events for the week
    upper_range_day = day +7
    upper_range_day = upper_range_day.to_s #convert it to string
    upper_range = "#{year}-#{month}-#{upper_range_day}"          #create the date
    
    # All events for the last 7 days
    @events = Event.all.where(date:datetime..upper_range,user_id:@user.id)

  end

  def update
  end
  

  def delete
      #find event
      event = Event.find(event_delete_params[:event_id])
      if event_delete_params[:user_id].to_i == event.user_id
        # they are the owner of the event delete it. 
        delete = Event.find(event_delete_params[:event_id]).delete
        json_data = {status:"success", message:"Event Deleted", event_id:event_delete_params[:event_id]}
        render json:json_data
      else
        json_data = {status:"fail",message:"You Don't Have Permission", event_id:event_delete_params[:event_id]}
        render json:json_data
      end
  end
  private
  def event_params
    params.require(:event).permit(:description,:date,:join_threshold,:circle_id,:user_id,:picture_id)
  end
  def event_delete_params
    params.require(:event).permit(:user_id,:event_id)
  end
end
