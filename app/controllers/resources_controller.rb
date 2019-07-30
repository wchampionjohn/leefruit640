class ResourcesController < ApplicationController
  helper_method :model_class, :model_class_name, :current_collection, :current_object
  def index
  end

  def new
    @current_object = default_scope.new
  end

  def create
    if @current_object = default_scope.create(object_params)
      flash[:success] = '新增成功'
      redirect_to action_after_create
    else
      render action: :new
    end
  end

  def update
    if current_object.update(object_params)
      flash[:success] = '更新成功'
      redirect_to action_after_update
    else
      render action: :edit
    end
  end

  def destroy
    current_object.destroy
    redirect_to action_after_destroy
  end

protected

  def model_class_name #may need to re-define in your controller
    self.class.to_s.demodulize.gsub('Controller', '').singularize
  end

  def model_class #may need to re-define in your controller
    model_class_name.constantize
  end

  def permitted_attributes
    #must re-define in your controller
  end

  def param_key
    model_class_name.underscore.to_sym
  end

  def default_scope
    model_class
  end

  def current_collection
    @current_collection ||= default_scope.page(params[:page])
  end

  def current_object
    @current_object ||= default_scope.find(params[:id])
  end

  def object_params
    params.require(param_key).permit(*permitted_attributes)
  end

  def action_after_create
    url_for action: :index
  end

  def action_after_update
    request.referrer || url_for(action: :index)
  end
  alias :action_after_destroy :action_after_update

end
