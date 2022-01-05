class AdminsArea::ClientsController < AdminsAreaController
  def index
    @clients = Client.all.page params[:page]
  end
end
