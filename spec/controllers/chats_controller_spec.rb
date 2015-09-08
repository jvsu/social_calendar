require 'rails_helper'

RSpec.describe ChatsController, type: :controller do
    describe "GET #all" do 
      before(:example){
        Event.new(description:"something cool", date:"3/12/15",time:"4:00PM", join_threshold:3, circle_id:1, user_id:1, picture_id:1).save
      }
      let(:event){
        @event = Event.find(1)
      }

        it "returns http found" do 
          get(:all,:event_id=>1)
          expect(response).to have_http_status(:found)
        end
      # it "assigns current_user to @user" do 
      #   get(:all,:event_id=>1)
      #   expect(assigns['user']).to eq(current_user)
      # end

        it "assigns event credentials to @event" do 
          get(:all,:event_id=>1)
          expect(assigns['event']).to eq(event)
        end

        it "assigns all chats that belong to the event to @chats"

        it "assigns all avatar records to @avatar"
    end

end
