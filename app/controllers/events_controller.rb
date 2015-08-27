class EventsController < ApplicationController
  def all

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
    if month =='02' && upper_range_day>28 # if it's feburary and we want days beyond feburary
      days = upper_range_day - 28 # days inton the next month
      day_string = days.to_s
      upper_range = "#{year}-03-#{day_string}"

    elsif month=='12' && upper_range_day >31
      year_int = year.to_i
      new_year = year_int +1
      days = upper_range_day - 31
      days = days.to_s
      upper_range = "#{new_year}-01-#{days}"

    elsif upper_range_day >30 # we aren't dealing with the special months
      if month =='04' || month=='06' || month =='09' || month=='11'
        month_int = month.to_i
        new_month = month_int +1
        days = upper_range_day -30
        days = days.to_s
        upper_range = "#{year}-#{new_month}-#{days}"
      else
        month_int = month.to_i
        new_month = month_int +1
        days = upper_range_day -31
        days = days.to_s
        upper_range = "#{year}-#{new_month}-#{days}"

      end
    else
     upper_range_day = upper_range_day.to_s #convert it to string
      upper_range = "#{year}-#{month}-#{upper_range_day}"          #create the date 
    end

    # upper_range_day = upper_range_day.to_s #convert it to string
    # upper_range = "#{year}-#{month}-#{upper_range_day}"          #create the date
    
    # All events for the last 7 days
    @events = Event.all.where(date:datetime..upper_range,user_id:@user.id).order(date: :asc)
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
    # upper_range_day = upper_range_day.to_s #convert it to string
    # upper_range = "#{year}-#{month}-#{upper_range_day}"          #create the date
    if month =='02' && upper_range_day>28 # if it's feburary and we want days beyond feburary
      days = upper_range_day - 28 # days inton the next month
      day_string = days.to_s
      upper_range = "#{year}-03-#{day_string}"

    elsif month=='12' && upper_range_day >31
      year_int = year.to_i
      new_year = year_int +1
      days = upper_range_day - 31
      days = days.to_s
      upper_range = "#{new_year}-01-#{days}"

    elsif upper_range_day >30 # we aren't dealing with the special months
      if month =='04' || month=='06' || month =='09' || month=='11'
        month_int = month.to_i
        new_month = month_int +1
        days = upper_range_day -30
        days = days.to_s
        upper_range = "#{year}-#{new_month}-#{days}"
      else
        month_int = month.to_i
        new_month = month_int +1
        days = upper_range_day -31
        days = days.to_s
        upper_range = "#{year}-#{new_month}-#{days}"

      end
    else
     upper_range_day = upper_range_day.to_s #convert it to string
      upper_range = "#{year}-#{month}-#{upper_range_day}"          #create the date 
    end


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
