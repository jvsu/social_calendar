class HomesController < ApplicationController
  def calendar
  	

    @user = current_user
    @avatar = Avatar.all
    # Get your confirmed joins
    joins = Join.all.where(confirm:true,user_id:@user.id)
    # put event ids in this array 
    event_ids = []

    joins.each do |j|
      event_ids.push(j.event_id)
    end

    # find events where you sent out invitations out for today
      invitations = Event.all.where(invitation:true, user_id:@user.id)
      
      #put ids into the event_ids
      invitations.each do |i|
        event_ids.push(i.id)
      end
    
    #get event information
    get_events = Event.order(time: :asc).find(event_ids)

  
    if params[:day] && params[:increment] #if day and increment parameters sent
      date = params[:date_calc].to_datetime
      increment = params[:increment].to_i
      #date with one day increment
      calc = date + increment
      @date_calc = calc 
      #make it available to the front end
      day = @date_calc.strftime("%d")
      @day= day.to_i
      @day_of_week = @date_calc.strftime("%A")
      year = @date_calc.strftime("%Y") #year
      month = @date_calc.strftime("%m") #month
      datetime = "#{year}-#{month}-#{day}"

        #get events today
        @today = []
        get_events.each do |e|
          if datetime == e.date.to_s
              @today.push(e)
          end
        end 
     
    else
        #set condition if you get a day value and an increment do calc else just do calc for today's date
        date = DateTime.now
        day = date.strftime("%d") #day
        #turn day into an int that you will add to the calendar nav
        @day = day.to_i
        @day_of_week = 'Today'
        @date_calc = date
        year = date.strftime("%Y") #year
        month = date.strftime("%m") #month
        datetime = "#{year}-#{month}-#{day}"

        #get events today
        @today = []
        get_events.each do |e|
          if datetime == e.date.to_s
              @today.push(e)
          end
        end 
    end
  end

  def day

  	
  end  
end
