class ItemsController < ApplicationController
	def show
		@item = Item.find(params[:id])
		respond_to do |format|
      format.html {render :layout => false}
      format.js
    end
	end

	def rate_inc
		
	end
end
