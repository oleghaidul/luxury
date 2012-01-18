class HomeController < ApplicationController
  def index
  	@boutiques = Boutique.all
  	render :layout => "home"
  	
  end

end
