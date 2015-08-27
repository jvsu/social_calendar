require 'json'

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
  	@user = current_user

  end

  def avatar
  	avatar = Avatar.new(avatar_params)
  	if avatar.save
  		redirect_to "/profiles/index"
  	else
  		redirect_to "/profiles/index"
  	end 
  end

  def update
    if update_params[:update]=='username'
      user = User.find(update_params[:user_id]).update(user_name:update_params[:username])
      json_data = {update:update_params[:update],change:update_params[:username]}
      render json:json_data

    elsif update_params[:update]=='email'
      user = User.find(update_params[:user_id]).update(email:update_params[:email])
      json_data = {update:update_params[:update],change:update_params[:email]}
        render json:json_data
    elsif update_params[:update]=='birthday' 
      user = User.find(update_params[:user_id]).update(birthday:update_params[:birthday])
      json_data = {update:update_params[:update],change:update_params[:birthday]}
        render json:json_data
    elsif update_params[:update]=='gender'
      user = User.find(update_params[:user_id]).update(gender:update_params[:gender])  
      json_data = {update:update_params[:update],change:update_params[:gender]}
      render json:json_data
    elsif update_params[:update]=='firstname'
      user = User.find(update_params[:user_id]).update(first_name:update_params[:first_name])
      json_data = {update:update_params[:update],change:update_params[:first_name]}
      render json:json_data
    elsif update_params[:update]=='lastname'
       user = User.find(update_params[:user_id]).update(last_name:update_params[:last_name])
      json_data = {update:update_params[:update],change:update_params[:last_name]}
      render json:json_data
    else
      json_data = {update:'none',change:'none'}
      render json:json_data
    end
  end

  private
  def avatar_params
    params.require(:avatar).permit(:user_id, :profile_pic)
  end

  def update_params
    params.require(:user).permit(:user_id, :username,:update,:email,:birthday,:gender, :first_name,:last_name)
  end

end
