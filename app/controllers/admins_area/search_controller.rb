class AdminsArea::SearchController < AdminsAreaController
  def products
    console
    @products = Product._search_(params[:title])
    @clients = Client.all.order(:name)
  end
end
