class Post < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  belongs_to :author

  def to_s
    name
  end

end
