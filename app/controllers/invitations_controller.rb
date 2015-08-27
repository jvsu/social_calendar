class InvitationsController < ApplicationController
  def all
  end

  def view
  end

  def new

  end

  def create
      #find the event and update the time
      time_update = Event.find(event_params[:event_id]).update(time:event_params[:time])
      #find the event and change invitation to true
      initation_update = Event.find(event_params[:event_id]).update(invitation:true)
      json_data = {message:"Invitations Sent",event_id:event_params[:event_id]}
      render json:json_data
      
  end

  def update
  end

  def send_invitation
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



    # All events for the last 7 days
    events = Event.all.where(date:datetime..upper_range,user_id:@user.id)
    emetrics = Emetric.all
    emetric_collection =[]
    #get emetrics that belong to the queried events
    emetrics.each do |e|
      events.each do |event|
        if e.event_id ==event.id
          emetric_collection.push(e)
        end
      end
    end
    # now put into the @qaulified_events array all the records where the join threshold is met

   events.each do |event|
      emetric_collection.each do |e|
        if e.event_id == event.id && e.join_num >= event.join_threshold 
            @qualified_events.push(event)
        end
      end
    end

    #events for you said you would join and now need to confirm. 
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

  def sent_invitation
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

    
    # All events for the last 7 days
    events = Event.all.where(date:datetime..upper_range,user_id:@user.id)
    emetrics = Emetric.all
    emetric_collection =[]
    #get emetrics that belong to the queried events
    emetrics.each do |e|
      events.each do |event|
        if e.event_id ==event.id
          emetric_collection.push(e)
        end
      end
    end
    # now put into the @qaulified_events array all the records where the join threshold is met

   events.each do |event|
      emetric_collection.each do |e|
        if e.event_id == event.id && e.join_num >= event.join_threshold 
            @qualified_events.push(event)
        end
      end
    end

    #events for you said you would join and now need to confirm. 
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

  def cancel
    #find the event id associated with the invitation
    #update the invitation value ot false
    event_cancel = Event.find(cancel_params[:event_id]).update(invitation:cancel_params[:invitation])
    #find all the joins with this id and change confirm to false
    joins = Join.all.where(event_id:cancel_params[:event_id])

    join_ids = []

    #put ids into an array
    joins.each do |j|
      join_ids.push(j.id)
    end

    join_ids.each do |join|
      Join.find(join).update(confirm:false)
    end
    json_data = {message:'Event Cancelled', event_id:cancel_params[:event_id]}
    render json:json_data
  end

  def delete
  end
  private
  def event_params
    params.require(:invitation).permit(:event_id,:time)
  end

  def cancel_params
    params.require(:invitation).permit(:event_id,:invitation)
  end
end
