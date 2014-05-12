class FabSpace < ActiveRecord::Base

  belongs_to :creator, class_name: 'User'
  belongs_to :fab_space
  has_many :projects

  def to_s
    name
  end

end
