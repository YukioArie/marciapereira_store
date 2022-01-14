class AdminsArea::OrderDetailsController < AdminsAreaController
  def index; end

  def new
    cart_client = Cart.find(params[:cart_id])
    order_detail = OrderDetail.create!(total_price: 0, client_id: cart_client.client.id)

    cart_client.items.each do |item|
      item.order_detail_id = order_detail.id
      item.cart_id = nil
      item.size.quantity -= item.quantity
      order_detail.total_price += item.size.product.price * item.quantity
      item.size.save!
      # order_detail.save!
      item.save!
    end
    cart_client.total_price = 0
    cart_client.save!
    all_cart = Cart.where('total_price > 0')
    all_cart.each do |cart|
      cart.items.each do |item|
        if item.size.quantity < item.quantity && item.size.quantity > 0
          quantity_difference = item.quantity - item.size.quantity
          item.quantity = item.size.quantity
          cart.total_price -= item.size.product.price * quantity_difference
          item.save!
          cart.save!
        elsif item.size.quantity.zero?
          cart.total_price -= item.size.product.price * item.quantity
          item.destroy!
          cart.save!
        end
      end
    end
    if order_detail.save!
      redirect_to admins_area_products_path, notice: 'Pagamento efetuado com sucesso!'
    else
      render :new
    end
  end
end
