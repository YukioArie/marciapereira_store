class AdminsArea::CartsController < AdminsAreaController
  before_action :set_cart_id_params, only: %i[add_quantity_item remove_quantity_item destroy_item]
  before_action :set_item_id_params, only: %i[add_quantity_item remove_quantity_item destroy_item]
  before_action :increment_total_price, only: %i[add_quantity_item]
  before_action :decrement_total_price, only: %i[remove_quantity_item destroy_item]
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
    if @item.destroy
      redirect_to admins_area_cart_path, notice: 'Item removido!'
    else
      render :index
    end
  end

  def remove_quantity_item
    @item.quantity -= 1
    if @item.save!
      redirect_to admins_area_cart_path
    else
      render :index
    end
  end

  def add_quantity_item
    @item.quantity += 1
    if @item.save!
      redirect_to admins_area_cart_path
    else
      render :index
    end
  end

  private

  def increment_total_price
    @cart.total_price += @item.size.product.price
    @cart.save!
  end

  def decrement_total_price
    @cart.total_price -= @item.size.product.price
    @cart.save!
  end

  def set_cart_id_params
    @cart = Cart.find(params[:cart_id])
  end

  def set_item_id_params
    @item = Item.find(params[:item_id])
  end

  def set_total_price(client_id, size_id)
    cart = Client.find(client_id).cart
    cart.total_price += Size.find(size_id).product.price
    cart.save!
  end
end
