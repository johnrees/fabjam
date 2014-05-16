class Project < ActiveRecord::Base

  extend FriendlyId
  friendly_id :name, use: :slugged

  belongs_to :creator, class_name: 'User'
  belongs_to :fab_space

  validates_presence_of :name, :description, :fab_space

  scope :find_by_year, lambda{ |year| where('extract(year from created_at) = ?', year)}

  def to_s
    name
  end

  def year
    created_at.year
  end

  def cover_image
    "http://i.imgur.com/7sMwlSC.jpg"
  end

end
