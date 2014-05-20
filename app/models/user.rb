class User < ActiveRecord::Base
  rolify

  has_many :projects, foreign_key: :creator_id
  has_many :fab_spaces, foreign_key: :creator_id
  has_many :posts, foreign_key: :author_id
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :first_name, :last_name, :email

  def to_s
    name
  end

  def name
    [first_name, last_name].join(' ')
  end

end
