class Post < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  default_scope { order('published_at DESC') }

  belongs_to :author, class_name: 'User'

  validates_presence_of :name, :body

  def to_s
    name
  end

end
