class AdminsArea::CartsController < AdminsAreaController
  def add_item_in_cart
    if Item.create_in_cart(params[:client_id], params[:size_id])
      set_total_price(params[:client_id], params[:size_id])
      @mensage_success = 'Item adicionado ao carrinho'
      # redirect_to admins_area_products_path, notice: 'Item adicionado ao carrinho'
    else
      @mensage_error = 'Esse tamanho já foi adicionado'
      # redirect_to admins_area_products_path, notice: 'Esse tamanho já foi adicionado'
    end
  end

  private

  def set_total_price(client_id, size_id)
    cart = Client.find(client_id).cart
    cart.total_price += Size.find(size_id).product.price
    cart.save!
  end
end
