require 'json'

class PicturesController < ApplicationController
  def new
    @user = current_user
    @picture = Picture.new
    #get all groups
    group_names = []
    pictures = Picture.all.where(:user_id=>@user.id)
    groups = Group.all

    if groups.length >0
      groups.each do |group|
        if group.picture.user_id == @user.id
          group_names.push(group[:name])
        end
      end
      #remove duplicates from group name
        group_names = group_names.uniq
      # remove uncategoried
        for i in 0..group_names.length
          if group_names[i]=="uncategorized"
            group_names.delete(i)
          end
        end
        @group_names = [["UNCATEGORIZED",'uncategorized'],['NEW GROUP','new group']]
        
        for i in 0..group_names.length-1
          @group_names.push([group_names[i].upcase,group_names[i]]);
        end
    end
  end

  def create
    if picture_params[:group] =="new group"
      picture = Picture.new(user_id:picture_params[:user_id],image:picture_params[:image]) #put picture in the DB
      if picture.save
         new_group_name = picture_params[:new_group].downcase
        group = Group.new(name:new_group_name, picture_id:picture.id).save
        json_data = {success:"Picture Saved and Group Created",status:"success"}
        render json:json_data
        # flash[:message] ='Picture and Group Saved'
        # redirect_to "/pictures/new"
      else
        json_data = {fail:"Picture Did Not Save", status:"fail"}
        render json:json_data

      end
    else
        picture = Picture.new(user_id:picture_params[:user_id],image:picture_params[:image])
        if picture.save
          group = Group.new(name:picture_params[:group], picture_id:picture.id).save
          json_data = {success:"Picture Saved", status:"success"}
          render json:json_data
          # flash[:message] ='1Picture and Group Saved'
          # redirect_to "/pictures/new"
        else
           json_data = {fail:"Picture Did Not Save", status:"fail"}
           render json:json_data
       end
    end
  end

  def update
  end

  def delete
  end

  def view
  end

  def all
  end
  private
  def picture_params
    params.require(:picture).permit(:image,:new_group,:group, :user_id)
  end



end
