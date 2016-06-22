class CabinetsController < ApplicationController
	def index
		@cabinets = Cabinet.all
	end

	def show
		@cabinet = Cabinet.find(params[:id])
		@foods = @cabinet.foods
	end

	def new
		@cabinet = Cabinet.new
	end

	def edit
		@cabinet = Cabinet.find(params[:id])
	end

	def create
		@cabinet = Cabinet.new(cabinet_params)
		if @cabinet.save
			redirect_to cabinets_path
		else
			render 'show'
		end
	end

	def update
		@cabinet = Cabinet.find(params[:id])
		@cabinet.update(cabinet_params)

		redirect_to cabinets_path
	end

	def destroy
		@cabinet = Cabinet.find(params[:id])
		@cabinet.destroy

		redirect_to cabinets_path
	end

	private
		def cabinet_params
			params.require(:cabinet).permit(:name)
		end
end
