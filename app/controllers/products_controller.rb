class ProductsController < ApplicationController

	before_action :load_product, only: [:show, :edit, :update, :destroy]
  
	  def load_product
	  	begin
	  		@product = Product.find(params[:id])
	  	rescue ActiveRecord::RecordNotFound => e 
	  		redirect_to products_path,
	  		notice: 'El producto no existe en el sistema'
	    end
	end

	def index
	  	@products = Product.all
	  end

	def show
	  	
	end

	  #cliente/new

	def new
		@product = Product.new
	end

	def create
		params_filtered = params.require(:product).permit(:ref, :price, :quantity, :brand, :description, :size, :color, :name)
		# {name:"Alexa, email:alexa@gmail", password: "123"} Estos son los parametros filtrados 
		@product = Product.new(params_filtered)
		if @product.save
			redirect_to products_path
		else
			render 'new'

		end
		end

	def edit

	end

		
	def update
		params_filtered = params.require(:product).permit(:ref, :price, :quantity, :brand, :description, :size, :color, :name)
		if @product.update(params_filtered)
			redirect_to products_path
		else
			render 'edit'

		end
	end

	def destroy
		@product.destroy
		redirect_to products_path,notice: 'Producto eliminado'
	end


end
