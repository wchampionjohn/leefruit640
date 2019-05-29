class Admin::UsersController < ResourcesController
  before_action :authenticate_admin!

  layout "admin"

  def collection_scope
    ::User.all
  end

  def object_params
    params.require(:user)
      .permit(
        :name, :email, :phone,
        :name, :city, :area, :address
      )
  end
end
