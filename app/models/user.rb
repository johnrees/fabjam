class User < ActiveRecord::Base
  rolify

  has_many :projects, foreign_key: :creator_id
  has_many :fab_spaces, foreign_key: :creator_id
  has_many :posts, foreign_key: :author_id

  has_one :member
  has_one :fab_space, through: :member

  scope :organisers, -> { includes(:fab_spaces).where.not("fab_spaces.creator_id" => nil) }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :async,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :first_name, :last_name, :email

  def email_string
    "#{u.name} <#{u.email}>"
  end

  def joined? space
    fab_space == space
  end

  def to_s
    name
  end

  def name
    [first_name, last_name].join(' ')
  end

end
