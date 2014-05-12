class Organisation < ActiveRecord::Base
  belongs_to :creator

  def to_s
    name
  end
end
