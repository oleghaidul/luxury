class BrandsController < ApplicationController
  before_filter :load_boutique

  def show
    if params[:season]
      @season = params[:season]
      @collections = @boutique.collections.where(:year => params[:year], :season => @season)
    else
      @season = "winter"
      @collections = @boutique.collections.where(:year => @season)
    end
  end

  def load_boutique
    @boutique = Boutique.find_by_url_bout(request.subdomain)
  end
end
