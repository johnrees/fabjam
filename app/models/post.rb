class Post < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  default_scope { order('published_at DESC') }

  belongs_to :author, class_name: 'User'

  validates_presence_of :name, :body

  def to_s
    name
  end

  def next
    Post.where("id > ?", id).order("id ASC").first
  end

  def prev
    Post.where("id < ?", id).order("id DESC").first
  end

end
