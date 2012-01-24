class ItemsController < ApplicationController
	def show
		@refferer = request.referer.split("/")
		@item = Item.find(params[:id])
		respond_to do |format|
      format.html {render :layout => false}
      format.js {render :layout => false}
    end
	end

	def popup
		@item = Item.find(params[:id])
		respond_to do |format|
	      format.html {render :layout => false}
	      format.js
	    end
	end
end
