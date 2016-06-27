class ListsController < ApplicationController
	def index
		@lists = List.all
	end

	def show
		@list = List.find(params[:id])
		@foods = Food.all
	end

	def new 
		@list = List.new
	end 

	def destroy
		@list = List.find(params[:id])
		@list.destroy
		redirect_to lists_path
	end

	def create
		@list = List.new(cabinet_params)
		if @list.save
			redirect_to list_path(@list)
		else 
			redirect_to lists_path
		end
	end

	private
		def cabinet_params
			params.require(:list).permit(:name)
		end
end
