class FabSpacesController < InheritedResources::Base

  load_and_authorize_resource
  skip_authorize_resource :only => :map
  defaults resource_class: FabSpace.friendly

  respond_to :html, :json

  def map
    @fab_spaces = FabSpace.all
  end

  def create
    @fab_space = build_resource
    @fab_space.creator = current_user
    create!
  end

  def join
    @fab_space = FabSpace.friendly.find(params[:id])
    current_user.fab_space = @fab_space
    current_user.save
    redirect_to @fab_space
  end

  def leave
    @fab_space = FabSpace.friendly.find(params[:id])
    current_user.member.delete
    redirect_to @fab_space
  end

private

  # def fab_space_params
  #   params.require(:fab_space).permit(:name, :description)
  # end

  def permitted_params
    params.permit(:fab_space => [:urls, :name, :description, :lat, :lng, :max_participants, :max_organisations, :logo_url, :fablabsio_id, :address, :country_code])
  end

end
