class ItemsController < ApplicationController
	def show
		@refferer = request.referer.split("/")
		@item = Item.find(params[:id])
		respond_to do |format|
      format.html
      format.js
    end
	end

	def rate_inc
		
	end
end
