class PostsController < InheritedResources::Base
  defaults resource_class: Post.friendly
private
  def permitted_params
    params.permit!
  end
end
