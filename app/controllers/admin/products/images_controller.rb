class Admin::Products::ImagesController < ApplicationController
  skip_before_action :verify_authenticity_token, :only => [:index, :create, :destroy]

  def index
    images = ::Product.find(params[:product_id]).images
    images = images.map do |image|
      {
        id: image.id,
        file_url: image.file.url ,
        file_name: image.file.file.filename
      }
    end

    render json: images.to_json, status: :ok

  end

  def create
    image = Product::Image.new(
      product: Product.find(params[:product_id]),
      file: params[:file]
    )

    if image.save

      response_image = {}
      response_image[:id] = image.id
      response_image[:file_url] = image.file.url
      response_image[:file_name] = image.file.file.filename

      render json: {
        image: response_image.to_json,
        filelink: image.file.url
      }, status: :ok
    else
      render json: { errors: service.errors.full_messages.last }, status: :unprocessable_entity
    end
  end

  def destroy
    product = Product.find params[:product_id]
    product.images.delete(Product::Image.find(params[:id]))
    render json: {}, status: :ok
  end
end
