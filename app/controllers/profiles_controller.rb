class ProfilesController < ApplicationController
  def all
  end

  def view
  	@user = current_user
  	avatar_find = Avatar.all.where(user_id:@user.id)
  	if avatar_find.length >0
  		@status='success'
  		@avatar = avatar_find[0]
  	else	
  		@status ='none'
  	end
  end

  def index
  	@current_user = current_user
  	@avatar = Avatar.new
  end

  def avatar
  	avatar = Avatar.new(avatar_params)
  	if avatar.save
  		redirect_to "/profiles/view"
  	else
  		redirect_to "/profiles/view"
  	end 
  end
  def avatar_params
    params.require(:avatar).permit(:user_id, :profile_pic)
  end

end
