
class StreamsController < ApplicationController
  def index
  	@user = current_user
    @avatar = Avatar.all
  	#find the circles you belong to
  	#find where you show up on the friends table by matching your user_id to friend_num
  	friendship = Friend.all.where(friend_num:@user.id)
  	circles = []
  	if friendship.length >0
  		#put the circle_ids into an array
  		friendship.each do |f|
  			circles.push(f.circle_id)
  		end
  		#get all events between today and 7 days into the future
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
    all_events = Event.all.where(date:datetime..upper_range)
    @all_events = []

    all_events.each do |e|
      for i in 0...circles.length
        if circles[i] == e.circle_id
          @all_events.push(e)
        end
      end
    end

     #today
     today =Event.all.where(date:date)
     @today_name = date.strftime("%A")
      @today =[]     
      today.each do |e|
      for i in 0...circles.length
        if circles[i] == e.circle_id
          @today.push(e)
        end
      end
    end

     #day one 
     day1_calc = day+1
     day1_s = day1_calc.to_s
     day1 = "#{year}-#{month}-#{day1_s}"
     @day1_date_title = "#{month}-#{day1_s}-#{year}" 
     date_calc = date +1
     @date1_name = date_calc.strftime("%A") 
     day_ones = Event.all.where(date:day1)
     @day1 = []
     day_ones.each do |e|
      for i in 0...circles.length
        if circles[i] == e.circle_id
          @day1.push(e)
        end
      end
    end

     #day two
     day2_calc = day+2
     day2_s = day2_calc.to_s
     day2= "#{year}-#{month}-#{day2_s}"  
     day_two = Event.all.where(date:day2)
     @day2 = []
     day_two.each do |e|
      for i in 0...circles.length
        if circles[i] == e.circle_id
          @day2.push(e)
        end
      end
    end
    #titles
    date2_calc = date +2
    @day2_date_title = "#{month}-#{day2_s}-#{year}" # date format
     @date2_name = date2_calc.strftime("%A") #day of the week



     #day three
     day3_calc = day+3
     day3_s = day3_calc.to_s
     day3= "#{year}-#{month}-#{day3_s}"
     day_three = Event.all.where(date:day3)
     @day3 =[]
     day_three.each do |e|
      for i in 0...circles.length
        if circles[i] == e.circle_id
          @day3.push(e)
        end
      end
    end

    date3_calc = date +3
    @day3_date_title = "#{month}-#{day3_s}-#{year}" # date format
     @date3_name = date3_calc.strftime("%A") #day of the week


     #day four
      day4_calc = day+4
      day4_s = day4_calc.to_s
      day4= "#{year}-#{month}-#{day4_s}"
      day_four = Event.all.where(date:day4)
      @day4 =[]
      day_four.each do |e|
      for i in 0...circles.length
        if circles[i] == e.circle_id
          @day4.push(e)
        end
      end
    end

    date4_calc = date +4
    @day4_date_title = "#{month}-#{day4_s}-#{year}" # date format
     @date4_name = date4_calc.strftime("%A") #day of the week


     #day five
     day5_calc = day+5
      day5_s = day5_calc.to_s
      day5= "#{year}-#{month}-#{day5_s}"
      day_five = Event.all.where(date:day5)
      @day5 =[]
      day_five.each do |e|
      for i in 0...circles.length
        if circles[i] == e.circle_id
          @day5.push(e)
        end
      end
    end

    date5_calc = date +5
    @day5_date_title = "#{month}-#{day5_s}-#{year}" # date format
     @date5_name = date5_calc.strftime("%A") #day of the week


     #day six
     day6_calc = day+6
      day6_s = day6_calc.to_s
      day6= "#{year}-#{month}-#{day6_s}"
      day_six = Event.all.where(date:day6)
      @day6 =[]
      day_six.each do |e|
      for i in 0...circles.length
        if circles[i] == e.circle_id
          @day6.push(e)
        end
      end
    end

    date6_calc = date +6
    @day6_date_title = "#{month}-#{day6_s}-#{year}" # date format
     @date6_name = date6_calc.strftime("%A") #day of the week


     #day seven
      day7_calc = day+7
      day7_s = day7_calc.to_s
      day7= "#{year}-#{month}-#{day7_s}"
      day_seven = Event.all.where(date:day7)
      @day7 =[]
      day_seven.each do |e|
        for i in 0...circles.length
          if circles[i] == e.circle_id
            @day7.push(e)
          end
        end

    date7_calc = date +7
    @day7_date_title = "#{month}-#{day7_s}-#{year}" # date format
    @date7_name = date7_calc.strftime("%A") #day of the week
    end  

  else
     @message = "Find Friends"
  end
end

  def all
    #get current user
    @user = current_user
    friendship = Friend.all.where(friend_num:@user.id)
    circles = []
    if friendship.length >0
      #put the circle_ids into an array
      friendship.each do |f|
        circles.push(f.circle_id)
      end
      #get all events between today and 7 days into the future
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
     all_events = Event.all.where(date:datetime..upper_range)
      @all_events = []

     all_events.each do |e|
       for i in 0...circles.length
          if circles[i] == e.circle_id
            @all_events.push(e)
          end
       end
      end
    end  
  end

  def view
    @user = current_user
    #find the circles you belong to
    #find where you show up on the friends table by matching your user_id to friend_num
    friendship = Friend.all.where(friend_num:@user.id)
    circles = []
    if friendship.length >0
      #put the circle_ids into an array
      friendship.each do |f|
        circles.push(f.circle_id)
      end
      #get all events between today and 7 days into the future
      date = DateTime.now
      day = date.strftime("%d") #day
      year = date.strftime("%Y") #year
      month = date.strftime("%m") #month

      if(params[:days]=='today')
        today =Event.all.where(date:date)
         @today_name = date.strftime("%A")
          @today =[]     
          today.each do |e|
            for i in 0...circles.length
              if circles[i] == e.circle_id
                @today.push(e)
              end
            end
          end

      elsif params[:days]=='1' || params[:days]=='2' || params[:days]=='3' || params[:days]=='4' || params[:days]=='5' || params[:days]=='6' || params[:days]=='7' 
        #calc to get the days out from today based on click
        days_out = params[:days].to_i
        new_day = day.to_i+ days_out
        day_string = new_day.to_s
        date_query= "#{year}-#{month}-#{day_string}"
        
        #get events based on the date
        day_events = Event.all.where(date:date_query)
         @day_events =[]
      

       day_events.each do |e|
          for i in 0...circles.length
           if circles[i] == e.circle_id
             @day_events.push(e)
            end
         end
        end

      #titles
       date_calc = date +7
      @day_date_title = "#{month}-#{day_string}-#{year}" # date format
      @date_name = date_calc.strftime("%A") #day of the week

      else
          flash[:message]='error message'
      end
    end
  end

  def interact
    @user = current_user
    @event = Event.find(params[:event_id])
    @join_threshold = @event.join_threshold
    emetrics = Emetric.all.where(event_id:@event.id)
    @emetrics = emetrics[0]
    #likes, send a status to front end to signify if you liked somehting already or not
    like = Like.all.where(user_id:@user.id,event_id:@event.id)
      if like.length >0
        # you have and existing like
        @status='existing_like'
      else
        @status = 'no_likes'
      end

      #joins

      joins = Join.all.where(user_id:@user.id,event_id:@event.id)
      if joins.length >0

        @join_status = "existing_join"
      else
        @join_status ="no_join"

      end


    #query and count the number of saves, likes, and joins

    #get group names so peopel can save photos to one of your groups
  #   group_names = ["uncategorized","new group"]
  #   pictures = Picture.all.where(:user_id=>@user.id)
  #   groups = Group.all 

  #   if groups.length >0
  #     groups.each do |group|
  #       if group.picture.user_id == @user.id
  #         group_names.push(group[:name])
  #       end
  #     end
  #   end

  #   @group_names = group_names.uniq
  end

end

