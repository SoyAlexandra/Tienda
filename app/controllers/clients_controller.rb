class ClientsController < ApplicationController
  #users/index
# Método que se ejecute antes de cada acción. Son filtros.
  before_action :load_client, only: [:show, :edit, :update, :destroy]
  
  def load_client
  	begin
  		@client = Client.find(params[:id])
  		rescue ActiveRecord::RecordNotFound => e 
  		redirect_to clients_path,
  		notice: 'El usuario no existe en el sistema'
    end
end

  def index
  	@clients = Client.all
  end

  def show
  	
  end

  #cliente/new

def new
	@client = Client.new
end

def create
	params_filtered = params.require(:client).permit(:name, :email, :password)
	# {name:"Alexa, email:alexa@gmail", password: "123"} Estos son los parametros filtrados 
	@client = Client.new(params_filtered)
	if @client.save
		redirect_to clients_path
	else
		render 'new'

	end
	end

def edit

end

def update
	params_filtered = params.require(:client).permit(:name, :email)
	if @client.update(params_filtered)
		redirect_to clients_path
	else
		render 'edit'

	end
end

def destroy
	@client.destroy
	redirect_to clients_path,notice: 'Usuario eliminado'
end

def login
	@client = Client.new
end

def do_login
	params_filtered = params.require(:client).permit(:email, :password)
	@client = Client.new(params_filtered)
	client_fetch = @client.login
	if client_fetch
		session[:client_id] = client_fetch.id
		redirect_to products_path, notice: 'Bienvenido a la tienda'
	else
		flash.now[:error] = 'Error al autenticarse'
		render 'login'
	end

def logout
	session[:client_id] = nil
		redirect_to login_clients_path, notice: 'Vuelve pronto'
	end	
end



end
