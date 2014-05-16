class StaticController < ApplicationController
  def home
    @fab_spaces = FabSpace.order("id DESC").limit(3)
    @posts = Post.order('published_at DESC').limit(3)
    # .where("published_at > ?", Time.now)
  end

  def about
  end
end
