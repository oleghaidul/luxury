class BoutiquesController < ApplicationController
  def show
    @boutique = Boutique.find_by_url_bout(params[:id])
  end
end
