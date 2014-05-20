class FabSpace < ActiveRecord::Base

  belongs_to :creator, class_name: 'User'
  belongs_to :fab_space
  has_many :projects

  validates_presence_of :name, :description, :max_participants, :address, :country_code
  validates_numericality_of :max_participants, greater_than: 0

  extend FriendlyId
  friendly_id :name, use: :slugged

  def to_s
    name
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
