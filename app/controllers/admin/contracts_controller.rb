class Admin::ContractsController < ResourcesController
  before_action :authenticate_admin!

  layout "admin"

  def collection_scope
    ::Contract.all
  end

end
