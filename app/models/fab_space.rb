class FabSpace < ActiveRecord::Base

  belongs_to :creator, class_name: 'User'
  belongs_to :fab_space
  has_many :projects

  validates_presence_of :name, :description

  extend FriendlyId
  friendly_id :name, use: :slugged

  def to_s
    name
  end

end
