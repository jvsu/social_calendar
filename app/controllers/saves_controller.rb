class SavesController < ApplicationController
  def all
  end

  def view
  end

  def new
  end

  def create
    # add to save table
    # add picture your group
  end

  def update
  end

  def delete
  end
  private
  def save_params
    params.require(:save).permit(:name,:new_name,:picture_id, :user_id, :event_id)
  end
end
