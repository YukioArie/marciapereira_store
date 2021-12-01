class AdminsArea::ProductsController < AdminsAreaController
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def edit; end

  def create
    @product = Product.new(params_product)
    if @product.save!
      redirect_to admins_area_products_path, notice: "Produto
      cadastrado com sucesso!"
    else
      render :new
    end
  end

  private

  def params_product
    params.require(:product).permit(:title, :price, :description, images: [],
                                                                  sizes_attributes: %i[id size_type quantity _destroy])
  end
end
