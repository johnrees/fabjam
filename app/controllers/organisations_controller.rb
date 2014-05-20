class OrganisationsController < InheritedResources::Base
  load_and_authorize_resource

private

  def permitted_params
    params.permit(:organisation => [:name, :description,:url])
  end

end
