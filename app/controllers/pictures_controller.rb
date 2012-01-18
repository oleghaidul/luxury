class PicturesController < ApplicationController
	def show
		@picture = Picture.find(params[:id])
		respond_to do |format|
      format.html {render :layout => false}
      format.js
    end
	end
end
