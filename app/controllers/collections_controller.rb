class CollectionsController < ApplicationController
	def show
		@brand = Brand.find(params[:brand_id]) if params[:brand_id]
		@boutique = Boutique.find_by_url_bout(params[:boutique_id])
		if @brand
			@collection = @brand.collections.find(params[:id])
			@collections = @brand.collections
		else
			@collection = @boutique.collections.find(params[:id])
			@collections = @boutique.collections
		end
	end
end
