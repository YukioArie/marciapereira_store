class AdminsArea::CartsController < AdminsAreaController
  def index
    @carts = Cart.includes(:client, :items).where('total_price > 0').order(:id)
  end

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

  def destroy_item
    @item = Item.find(params[:item_id])
    @cart = Cart.find(params[:cart_id])
    @cart.total_price -= @item.size.product.price
    if @item.destroy && @cart.save!
      redirect_to admins_area_cart_path, notice: 'Item removido!'
    else
      render :index
    end
  end

  def remove_quantity_item
    @cart = Cart.find(params[:cart_id])
    @item = Item.find(params[:item_id])
    @item.quantity -= 1
    @cart.total_price -= @item.size.product.price
    if @cart.save! && @item.save!
      redirect_to admins_area_cart_path
    else
      render :index
    end
  end

  def add_quantity_item
    @cart = Cart.find(params[:cart_id])
    @item = Item.find(params[:item_id])
    @item.quantity += 1
    @cart.total_price += @item.size.product.price
    if @cart.save! && @item.save!
      redirect_to admins_area_cart_path
    else
      render :index
    end
  end

  private

  def set_total_price(client_id, size_id)
    cart = Client.find(client_id).cart
    cart.total_price += Size.find(size_id).product.price
    cart.save!
  end
end
