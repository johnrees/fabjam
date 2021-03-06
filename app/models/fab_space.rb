class FabSpace < ActiveRecord::Base

  belongs_to :creator, class_name: 'User'
  belongs_to :fab_space
  has_many :members
  has_many :users, through: :members
  # has_many :projects
  has_and_belongs_to_many :projects

  validates_presence_of :name, :description, :max_participants, :address, :country_code
  validates_numericality_of :max_participants, greater_than: 0

  extend FriendlyId
  friendly_id :name, use: :slugged

  def to_s
    name
  end

  def blurb
    description.truncate(100)
  end

  def coordinates
    [lat,lng].join(',')
  end

  def links
    if urls.present?
      urls.split("\n").map(&:chomp).reject(&:blank?)
    else
      []
    end
  end

end
