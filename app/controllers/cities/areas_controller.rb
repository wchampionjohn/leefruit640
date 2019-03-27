class Cities::AreasController < ApplicationController
  def index
    areas = Area.where(city_id: params[:id])
    render json: { data: areas }, status: :ok
  end
end
