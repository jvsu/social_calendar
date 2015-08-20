class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
    validates :first_name, :last_name, :user_name, :password, :gender, :birthday, presence:true
    validates :email, presence:true, uniqueness:{case_sensitive: false }, format:{with:EMAIL_REGEX}
    has_many :circles
    has_many :friends
    has_many :events
    has_many :pictures 
    has_many :chats
    has_many :likes
    has_many :joins
    has_many :saves
    has_many :invitations
    has_one :avatars
    has_attached_file :avatar
    validates_attachment_content_type :avatar, :content_type => /\Aimage/
end
