class FoodsController < ApplicationController
	def index
		@foods = Food.all
		if params[:edit] == true
			@food = Food.find(params[:id])
		end
	end

	def new
		@food = Food.new
	end

	def edit
		@food = Food.find(params[:id])
		@foods = Food.all
		render 'index' # Requires a reload to get button to work
	end

	def create
		@cabinet = Cabinet.find(params[:cabinet_id])
		@food = @cabinet.foods.new(food_params)
		
		@food.save
		redirect_to cabinet_path(@cabinet)
	end

	def update
		@food = Food.find(params[:id])
		@food.update(food_params)
		cabinet = @food.cabinet
		redirect_to cabinet_path(cabinet)
	end

	def destroy
		@cabinet = Cabinet.find(params[:cabinet_id])
		@food = Food.find(params[:id])
		@food.destroy

		redirect_to cabinet_path(@cabinet)
	end

	private
		def food_params
			params.require(:food).permit(:name, :quantity, :weight)
		end
end
