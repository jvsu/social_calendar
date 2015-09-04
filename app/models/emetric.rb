class Emetric < ActiveRecord::Base
  belongs_to :event
  validates :event_id, presence:true
  validates :save_num, allow_blank:true, numericality:true
  validates :join_num, allow_blank:true, numericality:true
  validates :like_num, allow_blank:true, numericality:true
end
