class CategoriesController < ApplicationController
	def show
		@boutique = Boutique.find_by_url_bout(request.subdomain)
		@category = Category.find(params[:id])
	end
end
