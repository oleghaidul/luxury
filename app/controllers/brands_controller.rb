class BrandsController < ApplicationController
  before_filter :load_boutique

  def show
    if params[:season]
      @season = params[:season]
      if params[:year]
        @year = params[:year]
      else
        @year = 2012
      end
      @collections = @boutique.collections.where(:year => @year, :season => @season)
    else
      @season = "winter"
      if params[:year]
        @year = params[:year]
      else
        @year = 2012
      end
      @collections = @boutique.collections.where(:year => @year)
    end
  end

  def load_boutique
    @boutique = Boutique.find_by_url_bout(request.subdomain)
  end
end
