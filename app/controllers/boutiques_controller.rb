class BoutiquesController < ApplicationController
  def show
    @boutique = Boutique.find_by_url_bout(params[:id])
    @items = Array.new
    @boutique.collections.each{|col| @items=@items+col.items}
  end
  def desc
  	@content = Boutique.find_by_url_bout(params[:id]).description
  	render :layout => false
  end
end
