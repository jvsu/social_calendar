class ChatsController < ApplicationController
  def all
    @user = current_user
    @event = Event.find(params[:event_id])
    @chats = Chat.all.where(event_id:@event.id).order(created_at: :desc)
    @avatars = Avatar.all
    @chatter = Chat.new
    @pic = false
  end

  def view
  end

  def new
  end

  def create
    chat = Chat.new(chat_params)
    if chat.save
      flash[:message]="Chat Saved"
      redirect_to "/chats/all/#{chat_params[:event_id]}"
    else
      flash[:message]="Chat Not Saved"
      redirect_to "/chats/all/#{chat_params[:event_id]}"
    end


  end

  def update
  end

  def delete
    chat = Chat.find(params[:chat_id]).delete
    redirect_to "/chats/all/#{chat_params[:event_id]}"
  end
  private
  def chat_params
    params.require(:chat).permit(:user_id,:message,:event_id,:picture)
  end
end
