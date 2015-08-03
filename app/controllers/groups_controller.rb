class GroupsController < ApplicationController
  def all
    @user = current_user
    groups = Group.all
    groups_array = []

    groups.each do |g|
      if(g.picture.user_id ==@user.id)
        groups_array<<g.name
      end
    end
    #Remove Duplicates
    @groups = groups_array.uniq

  end

  def view
    @user = current_user
    @group_name = params[:name]
    @groups = Group.all.where(:name=>params[:name])
  end

  def new
  end

  def create
  end

  def update
  end

  def delete
  end
end
