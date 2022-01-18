class AdminsArea::OrderDetailsController < AdminsAreaController
  before_action :set_client_cart_params, only: [:create]
  before_action :create_order_detail, only: [:create]
  before_action :add_items_client_cart_to_order_details, only: [:create]
  before_action :set_client_cart_total_price, only: [:create]
  before_action :set_order_detail_total_price, only: [:create]
  before_action :update_product_size_quantity, only: [:create]

  def index; end

  def create
    Cart.update

    if @order_detail.save!
      redirect_to admins_area_products_path, notice: 'Pagamento efetuado com sucesso!'
    else
      render :index
    end
  end

  private

  def set_client_cart_params
    @client_cart = Cart.find(params[:cart_id])
  end

  def add_items_client_cart_to_order_details
    @client_cart.items.each do |item|
      item.order_detail_id = @order_detail.id
      item.cart_id = nil
      item.save!
    end
  end

  def update_product_size_quantity
    @order_detail.items.each do |item|
      item.size.quantity -= item.quantity
      item.size.save!
    end
  end

  def set_order_detail_total_price
    @order_detail.items.each do |item|
      @order_detail.total_price += item.size.product.price * item.quantity
      @order_detail.save!
    end
  end

  def create_order_detail
    @order_detail = OrderDetail.create!(total_price: 0, client_id: @client_cart.client.id)
  end

  def set_client_cart_total_price
    @client_cart.total_price = 0
    @client_cart.save!
  end
end
