class User < ActiveRecord::Base

  has_many :projects, foreign_key: :creator_id
  has_many :fab_spaces, foreign_key: :creator_id

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def to_s
    email
  end

end
