class OrganisationsController < InheritedResources::Base

private

  def permitted_params
    params.permit(:organisation => [:name, :description,:url])
  end

end
