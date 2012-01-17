class BoutiquesController < ApplicationController
  def show
    @boutique = Boutique.find(params[:id])
  end
end
