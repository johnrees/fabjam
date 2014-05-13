class FabSpacesController < InheritedResources::Base
  load_and_authorize_resource
  skip_authorize_resource :only => :map
  defaults resource_class: FabSpace.friendly

  def map
    @fab_spaces = FabSpace.all
  end

private

  # def fab_space_params
  #   params.require(:fab_space).permit(:name, :description)
  # end

  def permitted_params
    params.permit(:fab_space => [:name, :description])
  end

end
