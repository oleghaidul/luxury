class BrandsController < ApplicationController
	def show
		@boutique = Boutique.find_by_url_bout(request.subdomain)
		@brand = @boutique.brands.find(params[:id])
		@brands = @boutique.brands
	end
end
