class Admin::UsersController < ResourcesController
  before_action :authenticate_admin!

  layout "admin"

  def current_collection
    ::User.all
  end

  def permitted_attributes
    [
      :name, :email, :phone,
      :name, :city, :area, :address
    ]
  end
end
