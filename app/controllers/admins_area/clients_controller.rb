class AdminsArea::ClientsController < AdminsAreaController
  def index
    @clients = Client.all.page params[:page]
  end

  def new
    @client = Client.new
  end

  def create
    @client = Client.new(params_client)
    if @client.save!
      Cart.create!(total_price: 0, client_id: @client.id)
      redirect_to admins_area_clients_path, notice: 'Produto cadastrado com sucesso!'
    else
      render :new
    end
  end

  private

  def params_client
    params.require(:client).permit(:name, :email, :cellphone_number, :genre)
  end
end
