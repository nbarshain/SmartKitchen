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
		if params[:type] == 'cabinet'
			@cabinet = Cabinet.find(params[:parent_id])
			@food = @cabinet.foods.new(food_params)
			@food.save

			redirect_to cabinet_path(@food.cabinet)
		elsif params[:type] == 'list'
			@list = List.find(params[:parent_id])
			@food = @list.foods.new(food_params)
			@food.save

			redirect_to list_path(@food.list)
		else 
			redirect_to cabinets_path
		end
	end

	def update
		@food = Food.find(params[:food_id])
		# if @food.update(food_params)
		
		cabinet = Cabinet.find(params[:cabinet_id])
		@food.update(cabinet: cabinet, list: nil)
		# @food.cabinet = Cabinet.find(params[:cabinet_id])

		redirect_to cabinet_path(cabinet)
		# elsif @food.list
		# 	redirect_to list_path(@food.list)
		# else
		# 	redirect_to cabinets_path
		# end
		# else 


		
	end

	def destroy
		begin
			@cabinet = Cabinet.find(params[:cabinet_id]) || nil
			@food = Food.find(params[:id])
			@food.destroy
			redirect_to cabinet_path(@cabinet)
		rescue 
			@food = Food.find(params[:id])
			@food.destroy
			redirect_to cabinets_path
		end
	end

	def bought
		@food = Food.find(params[:food_id])
		@cabinets = Cabinet.all
	end

	private
		def food_params
			params.require(:food).permit(:name, :quantity, :weight)
		end
		def food_params_update
			params.require(:food).permit(:cabinet)
		end
end
