class Admin::ContractsController < ResourcesController
  before_action :authenticate_admin!

  layout "admin"

  def current_collection
    ::Contract.all
  end

end
