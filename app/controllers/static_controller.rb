class StaticController < ApplicationController
  def home
    @fab_spaces = FabSpace.order("id DESC").limit(3)
    @posts = Post.where("published_at > ?", Time.now).order('published_at DESC').limit(3)
  end

  def about
  end
end
