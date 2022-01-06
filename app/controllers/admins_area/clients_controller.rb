class AdminsArea::ClientsController < AdminsAreaController
  before_action :set_client, only: %i[destroy edit update]
  def index
    @clients = Client.all.page params[:page]
  end

  def new
    @client = Client.new
  end

  def destroy
    @cart = Cart.where(client_id: params[:id]).first
    if @cart.destroy! && @client.destroy!
      redirect_to admins_area_clients_path, notice: 'Cliente excluido com sucesso!'
    else
      render :index
    end
  end

  def edit; end

  def update
    if @client.update(params_client)
      redirect_to admins_area_clients_path, notice: 'Cliente atualizado com sucesso!'
    else
      render :edit
    end
  end

  def create
    @client = Client.new(params_client)
    if @client.save!
      Cart.create!(total_price: 0, client_id: @client.id)
      redirect_to admins_area_clients_path, notice: 'Cliente cadastrado com sucesso!'
    else
      render :new
    end
  end

  private

  def set_client
    @client = Client.find(params[:id])
  end

  def params_client
    params.require(:client).permit(:name, :email, :cellphone_number, :genre)
  end
end
