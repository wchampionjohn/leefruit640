class CartsController < ApplicationController

  def add
    spec = Product::Spec.find_by(id: params[:id])
    if spec
      @cart.add_item(spec.id)
      session[:my_cart] = @cart.serialize
      head :no_content
    else
      render json: { message: "查無此商品" }, :status => 404
    end
  end

  def show
  end
  def update_quantity
    # TODO 試看看用service object 重構
    quantity = params[:quantity].to_i
    spec_id = params[:id].to_i

    raise '數量必須為數字' if quantity == 0

    @cart.update_quantity(spec_id, quantity)
    session[:my_cart] = @cart.serialize

    render json: {}, status: :ok
  end

  def remove
    spec_id = params[:id].to_i
    @cart.destroy_item(spec_id)
    session[:my_cart] = @cart.serialize

    redirect_to checkout_cart_path, :flash => {:success => '已將商品城購物車移除'}
  end

  def checkout
    @order = Order.new
  end

end
