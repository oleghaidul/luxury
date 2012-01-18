class BoutiquesController < ApplicationController
  def show
    @boutique = Boutique.find_by_url_bout(params[:id])
  end
  def desc
  	@content = Boutique.find_by_url_bout(params[:id]).description
  	render :layout => false
  end
end
