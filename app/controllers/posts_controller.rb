class PostsController < InheritedResources::Base
  load_and_authorize_resource
  defaults resource_class: Post.friendly

  def create
    @post = build_resource
    @post.author = current_user
    create!
  end

private

  def permitted_params
    params.permit!
  end

end
