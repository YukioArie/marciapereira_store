class AdminsArea::SearchController < AdminsAreaController
  def products
    console
    @products = Product.includes(:images_blobs, :sizes).where('lower(title) LIKE ?', "%#{params[:title]}%")
    @clientes = Client.all.order(:name)
  end
end
