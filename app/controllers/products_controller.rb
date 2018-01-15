class ProductsController < ApplicationController
  	before_action :set_product, only: [:destroy]

		def index
    	@products = Product.all
  	end

		def create
			@product = Product.new(product_params)
			@product.save
			redirect_to @product.category
		end


	  def new
	    @product = Product.new
	  end

	  def destroy
	  	@product.destroy
	  	redirect_to @product.category
	  end

		private

		def set_product
      @product = Product.find(params[:id])
    end
		
		def product_params
					params.require(:product).permit(:name, :price, :category_id)
		end

end
