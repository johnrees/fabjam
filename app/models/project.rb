class Project < ActiveRecord::Base

  extend FriendlyId
  friendly_id :name, use: :slugged

  belongs_to :creator, class_name: 'User'
  belongs_to :fab_space

  has_and_belongs_to_many :fab_spaces

  # validates_presence_of :name, :description, :fab_space

  scope :find_by_year, lambda{ |year| where('extract(year from created_at) = ?', year)}

  def to_s
    name
  end

  def google_drive_id
    begin
      drive_url.scan(/(.*)id=(.*)&(.*)/).flatten[1]
    rescue
    end
  end

  # def year
  #   created_at.year
  # end

  # def cover_image
  #   "http://i.imgur.com/7sMwlSC.jpg"
  # end

end
