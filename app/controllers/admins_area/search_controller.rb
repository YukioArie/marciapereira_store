class AdminsArea::SearchController < AdminsAreaController
  def products
    console
    @products = Product._search_(params[:title], params[:page])
    @clients = Client.all.order(:name)
  end
end
