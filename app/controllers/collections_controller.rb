class CollectionsController < ApplicationController
  before_filter :load_boutique

	def show
    if params[:season]
      @collections = Collection.where(:year => params[:year], :season => params[:season])
    else
      @collections = Collection.where(:year => params[:year])
    end
	end

  def load_boutique
    @boutique = Boutique.find_by_url_bout(request.subdomain)
  end

end
